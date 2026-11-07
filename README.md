# compound-feed

Compound briefs (morning market news and idea case studies) as EPUB files,
for the Study > Compound screen of the x4-firmware on the Xteink X4 Pro.

- `feed/index.txt`: one line per brief, newest first:
  file, type, date, title, created_at, content hash (tab separated).
  The device re-downloads a brief when its hash changes.
- `feed/*.epub`: the briefs. The feed keeps the newest 30.

Device: put `/compound/feed.txt` on the SD card with

    url=https://raw.githubusercontent.com/natdanai2707/compound-feed/main/feed/

Publishing (done by the Compound scheduled tasks after each brief):

    tools/publish.sh <brief.json> <doc_id>

The brief JSON is the document from the Compound app's `briefs` collection.
EPUBs include the Thai translation; read them with the Sarabun reader font.
