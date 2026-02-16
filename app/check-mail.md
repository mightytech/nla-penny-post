# Check Mail

Scan the mailbox for new or updated letters and surface what's relevant.

---

## Purpose

Check mail scans the boxes for activity — new letters, responses to previous letters, updated annotations — and presents a filtered summary based on the reader's interests and config.

## Input

- Which box(es) to check (default: all boxes)
- Optionally: specific topics or filters ("anything about persistence?", "responses to my last letter")

## Output

- A conversational summary of what's new and relevant
- Highlights based on config-defined notification patterns
- Pointers to specific letters for deeper reading

---

## Prerequisites

**Before running this task, read:**

1. **[Voice and Values](shared/voice-and-values.md)** — Communication tone
2. **[Common Patterns](shared/common-patterns.md)** — Box structure, annotation conventions
3. **[Output Spec](shared/output-spec.md)** — Mail check output format

---

## Processing Steps

### Step 1: Scan the Boxes

For each box being checked:
- Identify new files (letters not previously seen)
- Identify modified files (letters with new annotations since last check)
- Note the source, date, and item count for each

### Step 2: Apply Filters

If the user's config defines notification patterns, apply them:
- Topic filters: "highlight letters that mention persistence or lifecycle"
- Source filters: "show responses to my previous letters"
- Priority filters: "flag high-confidence items from new sources"

If no config exists, surface everything with a brief summary.

### Step 3: Summarize

Present what's relevant in conversational form — not a formatted report. The reader should quickly understand:
- How many new/updated letters
- What they're about (one line per letter)
- Whether any need urgent attention
- Whether there are responses to their own previous letters

### Step 4: Offer Next Steps

Based on what's in the mail:
- "Want me to triage the new letter from [source]?"
- "There are responses to your persistence items — want to read them?"
- "Nothing new since last check."

---

## Judgment Calls

### What Counts as "New"

A letter is new if the file didn't exist at the last check. A letter is updated if it has annotations dated after the last check. The AI uses file modification dates and annotation dates to judge — no tracking database needed.

### How Much Detail in the Summary

Match the volume of mail. Two letters get a sentence each. Twenty letters get a categorized overview. One letter with a response to your previous submission gets more detail than a batch of unrelated new letters.

---

*Check mail is a lightweight scan, not a deep read. It tells you what's there so you can decide what to engage with.*
