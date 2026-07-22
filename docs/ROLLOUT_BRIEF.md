# FSI App Suite — Rollout Communications Brief

**Audience for this document:** Cowork sessions and the design team producing
rollout materials (announcements, quick-start guides, training decks, help
handouts) for the FSI app suite.

**How to use it:** This brief is **modular**. Each app is a module, and most
modules are split into **audience tiers**. Rollout materials are assembled by
picking the modules and tiers that apply to a given audience — never by
describing the whole suite to everyone. A warehouse employee's packet and a
finance manager's packet share the Suite Basics module and nothing else.

Three distribution levels apply throughout:

| Level | Meaning |
|---|---|
| **General** | Safe to include in all-staff materials. |
| **Manager** | Only in materials for supervisors/approvers/admins. |
| **Restricted** | Only for individually named people. Do not include in any broadly distributed material, do not mention in all-staff announcements. |

---

## 1. Personas (who materials get built for)

| Persona | Description | Typical modules |
|---|---|---|
| General employee | Any FSI staff member | Suite Basics, Expenses (employee tier), PDFer |
| Supervisor / manager | Approves expense reports; may handle onboarding/offboarding | + Expenses (manager tier), Lifecycle |
| Finance | Finalizes expenses, exports to NetSuite | + Expenses (finance tier) |
| Ops / dispatch | Freight operations, load boards, POD oversight | + POD, Quotes, Asset Tracking |
| Drivers | Field delivery staff | Suite Basics (minimal), POD (capture tier) |
| Quoting staff | Staff producing freight quotes | + Quotes |
| Admins | User management, app configuration | Admin tiers of relevant modules |
| Named individuals | Specifically assigned access (Comms, Inventory for now) | Restricted modules |

**Note on role vocabulary:** most apps share one account system (see Suite
Basics) with roles Employee / Supervisor / Finance / Admin (Expenses adds
Final Approver; POD adds an "ops" override). Lifecycle gates on a
"can manage lifecycle" flag. Quotes has its own separate accounts
(super admin / employee / customer). Materials should use the persona names
above, not internal role constants.

---

## 2. Module: Suite Basics — **General**

The shared foundation. Include in every packet.

- **Landing page:** `home.freightservices.net` — the front door with a card
  for each app (Quotes, POD, Asset Tracking, Expenses, Lifecycle, Internal
  Comms). Teach people to start here rather than bookmarking individual apps.
- **One account for internal tools:** Expenses is where accounts live.
  The same email + password also signs into POD, INBOX/Comms, and the Asset
  Tracking dashboard. Registration, password reset, and Microsoft SSO happen
  in Expenses only. **Exception:** Quotes has its own separate login (with
  email 2FA). PDFer and the landing page need no login at all.
- **Consistent look:** all apps share the FSI design language, including a
  dark-mode toggle.
- **Help centers:** Expenses and Quotes have built-in Help sections —
  materials should point to these for self-service rather than duplicating
  every step.

---

## 3. Module: Expenses — three audience tiers + admin

The anchor app of the suite: employees submit expense reports, supervisors
review them, finance finalizes and exports to NetSuite. Every report goes
through supervisor review — there is no auto-approval, and materials can say
so as a selling point ("your manager always sees it before finance does").

### E-1 · General user tier — **General**
For every employee. Cover:
- Signing in / registering (this is also their suite-wide account).
- **My Reports** — see your reports and their status.
- **New Report** — create a report, add line items, attach receipt photos,
  submit.
- What the statuses mean in plain language: Submitted → with your manager →
  (possibly a final approver) → with finance → finalized.
- Where to look things up: the built-in Help Center (getting started, report
  submission, receipts, account management).
- Omit: anything about the review queue, finance, exports, or admin.

### E-2 · Manager tier — **Manager**
For supervisors and final approvers. Covers E-1 plus:
- **Supervisor Dashboard** — the review queue of reports waiting on you.
- Reviewing a report: approve or reject with feedback.
- **Approval history** — read-only record of what you've decided.
- Final-approver step: some reports route to a designated final approver
  after the supervisor; who approves whom is configured centrally (in
  Lifecycle — managers don't set this up themselves, they just see the queue).
- Expectation-setting: weekly reminder emails go out automatically when items
  sit in your queue.

### E-3 · Finance tier — **Manager** (finance staff only)
Covers E-2 plus:
- Finance review and finalization of approved reports.
- NetSuite export dispatch.
- Finance sees all reports regardless of approval hierarchy.

### E-4 · Admin tier — **Restricted**
- User management, communication settings (weekly reminder digests), app
  settings. Only for named admins; not part of any training rollout.

---

## 4. Module: Lifecycle — manager-level, with one carve-out

Onboarding/offboarding automation plus company asset inventory. **Everything
in this module is Manager-level material except as noted** — do not include
Lifecycle in general-employee packets.

### L-1 · Intake & approvals — **Manager**
- The intake form: submitting an onboarding or offboarding request.
- Manager approval by emailed link — approve/reject a request straight from
  the email, no login needed for that step. This is worth a dedicated
  one-pager since it's the piece most managers will actually touch.
- Automated downstream dispatch (IT vendor, ops) happens without further
  action — set the expectation that submitting the form is the whole job.

### L-2 · Inventory — **Restricted (for now)**
Asset tracking: categories, photos, status (Available / Assigned / In Repair /
Retired / Lost), barcode/QR and Bluetooth scanning.
- **Current rollout state: gated to a few named people.** Build the materials,
  but distribute only to the named group. Do not mention inventory in
  broad announcements yet.
- **Planned future state:** possibly view-only access for everyone. Design
  the materials in two layers now — a "look things up" viewer layer and a
  "manage assets" editor layer — so the viewer layer can be released broadly
  later without rework.

### L-3 · User Permissions console & intake builder — **Restricted**
The suite-wide access-control pane (per-app roles, expense approval
hierarchy, mailbox access) and the intake-question editor. Admin-only
tooling; document for the admin group only, never in training materials.

---

## 5. Module: Quotes — quoting staff and admins

Freight quoting (Hotshot and Air) for FSI staff and trusted partners.
**Separate login from the rest of the suite** (email + 2FA code) — say this
explicitly in its materials, since it breaks the "one account" rule.

### Q-1 · Quoting staff tier — **Manager** (quoting/ops staff)
- Creating a quote: ZIPs, weight, extras; Air vs Hotshot.
- Quote history.
- Booking escalation: "Email to Request Booking" / "Email to Book" buttons.
- Science Care multi-leg quoting, for the subset of staff who handle it
  (its own mini-tier — only include for that group).

### Q-2 · Customer/partner tier — **General** (external-facing, separate design)
- Trusted partners can quote but see booking actions disabled. If partner
  materials are ever produced, they are a separate deliverable with external
  branding review — flag for design.

### Q-3 · Admin tier — **Restricted**
- User approval, rate editing, surcharge (VSC) configuration. Named admins
  only.

---

## 6. Module: POD (Proof of Delivery) — drivers and ops

Mobile-first delivery capture: photo, signature, and GPS at delivery
checkpoints, plus an ops dashboard tracking shipment legs.

### P-1 · Driver capture tier — **General** (drivers)
- Signing in on a phone (same account as Expenses).
- The capture flow: task list → photo → signature → done. Keep this tier
  extremely short and visual — it is the packet most likely to be read
  standing in a truck.

### P-2 · Ops/dashboard tier — **Manager** (ops staff)
- Dashboard and load board, shipment-leg progression
  (created → dispatched → in transit → arrived → POD captured → completed),
  team approvals, POD history/export. Ops staff get elevated access via an
  ops flag without being admins.

---

## 7. Module: Asset Tracking dashboard — **Manager** (ops)

The Streamlit dashboard for Raspberry-Pi edge assets: live map, edge device
health, power monitoring, Bluetooth asset/beacon inventory, sensor history,
shipment manager. Signs in with the shared (Expenses) account; any active
internal account can log in — audience control here is by *who you teach*,
not by role, so keep its materials scoped to ops.

One **General** exception: the **public shipment tracking page** — customers
follow a tokenized link to track a shipment with no login. Materials for
staff who send those links belong in the ops packet.

---

## 8. Module: PDFer — **General**

Small standalone utility: combine PDFs (drag-and-drop page reorder) and split
PDFs by page range, entirely in the browser — files never leave the user's
machine (a privacy point worth stating). No login. Suitable as a one-paragraph
mention or a half-page handout in the general packet.

---

## 9. Module: Internal Comms (INBOX) — **Restricted**

⚠️ **Handle this module differently from all others.**

- Access is a **specifically assigned role**; it is **not taught to all
  users** and must not appear in all-staff announcements, the general
  training deck, or broad rollout emails.
- **Especially the Internal Comms section** (`/comms`): a read-only,
  CRM-style archive of all email traffic the FSI app suite sends and
  receives — message streams, searchable history, per-contact conversation
  threads, delivery events. Because it exposes correspondence, its materials
  go only to the individually assigned people, ideally delivered 1:1.
- The archive is read-only (it never sends mail); syncing from the mail
  provider is an admin-only action.
- The broader shared-inbox features (claiming, replying, Outlook-synced
  mailboxes) are **planned, not built** — write nothing about them yet, and
  keep the door open in the doc structure for a later module revision.
- Rollout philosophy from the project's own decision records: staff are
  change-averse; every step is phased and reversible, and nothing forces a
  cutover away from Outlook. Any future Comms/INBOX materials must echo that
  tone: "this adds visibility, it doesn't replace how you work."

---

## 10. Packet assembly matrix

| Persona | Suite Basics | Expenses | Lifecycle | Quotes | POD | Asset Track. | PDFer | Comms |
|---|---|---|---|---|---|---|---|---|
| General employee | ✅ | E-1 | — | — | — | — | ✅ | — |
| Supervisor/manager | ✅ | E-1+E-2 | L-1 | — | — | — | ✅ | — |
| Finance | ✅ | E-1–E-3 | — | — | — | — | ✅ | — |
| Ops/dispatch | ✅ | E-1 | L-1 if approver | Q-1 | P-2 | ✅ | ✅ | — |
| Driver | ✅ (minimal) | E-1 | — | — | P-1 | — | — | — |
| Quoting staff | ✅ | E-1 | — | Q-1 | — | — | ✅ | — |
| Admins | ✅ | E-4 | L-3 | Q-3 | — | — | — | — |
| Named individuals only | — | — | **L-2 (Inventory, for now)** | — | — | — | — | **✅ Comms** |

---

## 11. Production notes for the design team

- **Formats:** each tier should work as (a) a one-page quick-start PDF,
  (b) a short deck section, and (c) a help-center-style web page — same
  content, three renderings. Modularity means a tier is written once and
  dropped into whichever packet needs it.
- **Screenshots:** capture from local/staging instances only, never
  production (production screens contain real employee and financial data —
  and real correspondence, in the case of Comms).
- **Tone:** freight staff are change-averse. Lead every module with "what
  this does for you," keep steps short, and emphasize that existing
  workflows (especially Outlook) are not being taken away.
- **Sequencing suggestion:** announce Suite Basics + Expenses first (largest
  audience, clearest value), then manager modules (Lifecycle L-1, Expenses
  E-2/E-3), then ops modules (POD, Quotes, Asset Tracking). Restricted
  modules (Inventory, Comms) are delivered individually and never announced
  broadly.
- **Future-proofing:** two flagged revisions are expected — Inventory (L-2)
  broadening to view-only-for-everyone, and INBOX shared-mailbox features
  going live. Structure files/templates so those become new tier inserts,
  not rewrites.
