# Friction Log Archive

Resolved entries from the friction log, preserved for searchable history.

---

*Entries are moved here by `/maintain` when resolved. Newest first.*

## 2026-02-17 — gh CLI token lacks issue comment/close permissions

**Type:** process
**Severity:** major
**Task:** /check-feedback end-to-end test
**Status:** resolved
**Resolved:** 2026-02-17 — Token fixed via `gh auth refresh --scopes repo`. Built
`lib/check-setup.sh` to detect permission issues. Updated check-feedback.md Step 6
and write-letter.md Step 4 with graceful error handling and reference to check-setup.
install/install.md already lists gh CLI as prerequisite.

**Observation:**
During the first end-to-end test of /check-feedback, the archive step succeeded but
the "close the loop on GitHub" step failed. The `gh` CLI token can create issues and
repos but cannot comment on or close issues (HTTP 403, "Resource not accessible by
personal access token").

**Generalizable:** yes — any NLA using penny post with GitHub Issues will need a token
with sufficient permissions. The check-feedback and write-letter docs should note the
required token scopes, and ideally detect and report permission issues gracefully rather
than failing mid-flow.
