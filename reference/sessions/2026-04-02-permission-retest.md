# Maintenance Session: Permission Retest

**Date:** 2026-04-02
**Status:** Complete

## Intent

Rerun the Issue #11 permission behavior test with the maintainer observing Claude Code
prompts in real time, then report results back to the framework.

## Changes Made

- **Retested Issue #11** — Ran the full test protocol (direct reads and symlink reads
  for framework and process-helpers paths) with maintainer watching for permission prompts.
  All four test cases produced clear results.
- **Submitted results to framework** — Filed as [nla-framework#16](https://github.com/mightytech/nla-framework/issues/16)
  with full data table, findings, and recommendation.
- **Closed Issue #11** — Posted follow-up comment with results summary and link to
  the framework issue. Test request fulfilled.

## Key Findings

| Path | Type | Allow entry? | Prompts |
|------|------|-------------|---------|
| `../nla-framework/` | Direct | Yes | 0 |
| `../nla-process-helpers/` | Direct | No | 1 |
| `dependencies/nla-framework/` | Symlink | Yes (for `../` path) | 2 |
| `dependencies/nla-process-helpers/` | Symlink | No | 1 |

Symlinks do not bypass permission checks — they add friction. The `settings.local.json`
allow entry approach works correctly for direct `../` paths. This rules out the symlink
approach the framework was investigating.

## Debrief

- The test ran cleanly once the maintainer knew to watch for prompts — the prior
  session's failure was purely a process issue (not flagging what the human needed to
  observe before starting).
- The double-prompt on the framework symlink read was the most interesting data point.
  It suggests Claude Code may check permissions at both the symlink path and the resolved
  real path, but this is speculative.
- This reinforces that Issue #9 (adding permissions to the install manifest) is the right
  approach — declaring needed permissions at install time so they're pre-approved.

## State at Close

- **Working:** Issue #11 retest complete, results delivered to framework as nla-framework#16.
- **Pending:**
  - 4 feedback log items: Issue #10 Items 1-2 (README paragraph, CONTRIBUTING blast
    radius), Issue #9 (permissions in install manifest), Issue #4 Item 3 (triage
    calibration monitoring)
  - 1 resolved friction log entry awaiting archival (2026-02-23, boxes/ delivery)
  - Uncommitted changes from today's triage session (feedback log entries, session logs)
- **Next:** Implement pending feedback items. Issue #9 (permissions) is the most
  natural next — it connects directly to the permission findings from this session.
