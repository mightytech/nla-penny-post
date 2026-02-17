#!/usr/bin/env bash
#
# Penny Post Setup Check
#
# Verifies that the prerequisites for penny post are in place:
# - gh CLI installed
# - gh authenticated
# - Required permissions on the target repo
#
# Usage: ./lib/check-setup.sh owner/repo
# Example: ./lib/check-setup.sh mightytech/my-nla

set -euo pipefail

REPO="${1:-}"
PASS="OK"
FAIL="FAILED"
WARN="WARN"
errors=0
warnings=0

# --- Helpers ---

print_check() {
    local label="$1"
    local status="$2"
    local detail="${3:-}"
    printf "  %-24s %s" "$label:" "$status"
    if [ -n "$detail" ]; then
        printf " — %s" "$detail"
    fi
    printf "\n"
}

# --- Usage ---

if [ -z "$REPO" ]; then
    echo "Penny Post Setup Check"
    echo ""
    echo "Usage: ./lib/check-setup.sh owner/repo"
    echo "Example: ./lib/check-setup.sh mightytech/my-nla"
    echo ""
    echo "Checks whether the gh CLI is installed, authenticated, and has"
    echo "the permissions needed for penny post to operate on the given repo."
    exit 1
fi

echo "Checking penny post prerequisites for $REPO..."
echo ""

# --- Step 1: gh CLI installed ---

if command -v gh &>/dev/null; then
    gh_version=$(gh --version | head -1)
    print_check "gh CLI" "$PASS" "$gh_version"
else
    print_check "gh CLI" "$FAIL" "not installed"
    echo ""
    echo "Install the GitHub CLI: https://cli.github.com/"
    exit 1
fi

# --- Step 2: gh authenticated ---

if gh auth status &>/dev/null; then
    gh_user=$(gh api user --jq '.login' 2>/dev/null || echo "unknown")
    print_check "gh auth" "$PASS" "authenticated as $gh_user"
else
    print_check "gh auth" "$FAIL" "not authenticated"
    echo ""
    echo "Fix: run 'gh auth login' to authenticate."
    exit 1
fi

# --- Step 3: Token scopes ---
# Check what scopes the token has by reading response headers.
# This works for classic PATs. Fine-grained PATs don't expose scopes
# the same way, so we fall back to testing operations directly.

scopes=$(gh api -i user 2>/dev/null | grep -i "x-oauth-scopes:" | sed 's/x-oauth-scopes: //i' | tr -d '\r' || echo "")

if [ -n "$scopes" ]; then
    print_check "token scopes" "$PASS" "$scopes"

    # Check if 'repo' scope is present (covers all issue operations)
    if echo "$scopes" | grep -qw "repo"; then
        has_repo_scope=true
    else
        has_repo_scope=false
    fi
else
    print_check "token scopes" "$WARN" "could not determine (fine-grained PAT?)"
    has_repo_scope=unknown
fi

# --- Step 4: Repo access ---

repo_perms=$(gh api "repos/$REPO" --jq '[.permissions | to_entries[] | select(.value == true) | .key] | join(", ")' 2>/dev/null || echo "")

if [ -n "$repo_perms" ]; then
    print_check "repo access" "$PASS" "$repo_perms"
else
    print_check "repo access" "$FAIL" "cannot access $REPO"
    errors=$((errors + 1))
fi

# --- Step 5: Test operations ---

echo ""
echo "Testing operations..."
echo ""

# Test: list issues (read)
if gh api "repos/$REPO/issues?per_page=1&state=all" &>/dev/null; then
    print_check "list issues (read)" "$PASS"
else
    print_check "list issues (read)" "$FAIL"
    errors=$((errors + 1))
fi

# Test: create issue (write)
test_issue_url=$(gh api "repos/$REPO/issues" \
    -f title="[setup-check] Permission test — safe to delete" \
    -f body="This issue was created by penny post's setup check to verify permissions. It should be deleted automatically. If you see this, the cleanup failed — safe to delete manually." \
    --jq '.number' 2>/dev/null || echo "")

if [ -n "$test_issue_url" ]; then
    print_check "create issues (write)" "$PASS"
    test_issue_number="$test_issue_url"

    # Test: comment on issue
    comment_id=$(gh api "repos/$REPO/issues/$test_issue_number/comments" \
        -f body="[setup-check] Testing comment permissions." \
        --jq '.id' 2>/dev/null || echo "")

    if [ -n "$comment_id" ]; then
        print_check "comment on issues" "$PASS"
        # Clean up comment
        gh api "repos/$REPO/issues/comments/$comment_id" -X DELETE &>/dev/null || true
    else
        print_check "comment on issues" "$FAIL"
        errors=$((errors + 1))
    fi

    # Test: close issue
    close_result=$(gh api "repos/$REPO/issues/$test_issue_number" \
        -X PATCH -f state=closed \
        --jq '.state' 2>/dev/null || echo "")

    if [ "$close_result" = "closed" ]; then
        print_check "close issues" "$PASS"
    else
        print_check "close issues" "$FAIL"
        errors=$((errors + 1))
    fi

    # Clean up: close the test issue and mark it as completed
    # GitHub doesn't support issue deletion via API, so we close and relabel
    cleanup_result=$(gh api "repos/$REPO/issues/$test_issue_number" \
        -X PATCH \
        -f state=closed \
        -f title="[setup-check] Completed — safe to delete" \
        -f body="Penny post setup check completed. This issue can be safely deleted." \
        --jq '.state' 2>/dev/null || echo "")

    if [ "$cleanup_result" != "closed" ]; then
        echo ""
        echo "  Note: Test issue #$test_issue_number could not be closed automatically."
        echo "  Please close or delete it manually at:"
        echo "  https://github.com/$REPO/issues/$test_issue_number"
    fi

else
    print_check "create issues (write)" "$FAIL"
    print_check "comment on issues" "SKIP" "cannot test without create"
    print_check "close issues" "SKIP" "cannot test without create"
    errors=$((errors + 1))
fi

# --- Summary ---

echo ""

if [ "$errors" -eq 0 ]; then
    echo "All checks passed. Penny post is ready to use with $REPO."
else
    echo "$errors check(s) failed."
    echo ""
    echo "To fix, run:"
    echo ""
    echo "  gh auth refresh --hostname github.com --scopes repo"
    echo ""
    echo "This tells GitHub to create a token with the right permissions."
    echo "You don't need to pick permissions manually — the command specifies them."
    echo ""
    echo "It will display a URL and a one-time code. Open the URL in any browser"
    echo "(phone, laptop, any device) and enter the code to authorize. If you're"
    echo "on a headless server, copy the URL and open it on another device."
    echo ""
    echo "After authorizing, re-run this script to verify:"
    echo ""
    echo "  ./lib/check-setup.sh $REPO"
    echo ""

    if [ "$has_repo_scope" != "unknown" ] && [ "$has_repo_scope" != false ]; then
        echo "Note: Your token already has the 'repo' scope but some operations"
        echo "still failed. Check that you have write access to $REPO."
    fi
fi

exit $errors
