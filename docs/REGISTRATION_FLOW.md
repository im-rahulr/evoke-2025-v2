# Registration & Payment Flow

- **Entry point**

  - Home `index.html` main CTA `Register Now` → `pages/events-list.html`.
  - Footer "Register" also exists and points to `pages/register.html` (direct registration allowed).

- **Event selection** (`pages/events-list.html`)

  - User selects one or more events (₹100 per event; totals shown dynamically).
  - If the user is NOT yet registered:
    - Click "Proceed to Register" stores selections in `sessionStorage` as `pendingEventSelections`, plus `eventCount` and `totalAmount`.
    - Redirect → `pages/register.html`.
  - If the user IS registered (session has `lastToken` & `lastName`):
    - Click "Proceed to Register" saves selections to Firestore, sets `eventCount` and `totalAmount`, then redirects → `pages/success.html`.
  - After returning from registration with pending selections, the page auto-continues to save and redirect without another click.

- **Registration** (`pages/register.html`)

  - User submits details; a token (`shortId`) is generated and stored.
  - Session is populated (`lastToken`, `lastName`, etc.).
  - After a short success animation, redirect → `pages/events-list.html` to complete event selection.

- **Payment choice** (`pages/success.html`)

  - Shows two options:
    - "Pay on Spot" (recommended): shows token, allows RSVP/ticket download with QR.
    - "Pay Online Now": prepares `payment_user_context` and redirects → `pages/payment.html`.

- **Online payment** (`pages/payment.html`)

  - Displays dynamic amount from `sessionStorage` and user context.
  - QR and UPI deep link provided. "Check Payment Status" guides manual confirmation.

- **Guards & UX**

  - `events_submitted_token` prevents resubmission and back-navigation from Success.
  - Robust session checks and defaulting for `eventCount`/`totalAmount`.

- **Data stored in sessionStorage (selected keys)**

  - `pendingEventSelections`, `eventCount`, `totalAmount`.
  - `lastToken`, `lastName`, `lastCollege`, `lastCourse`.
  - `payment_user_context`, `payment_context` (for online payment).

## Expected User Path

1. Click "Register Now" on Home → Events List.
2. Select events → Proceed.
3. If not registered → Registration → back to Events List (auto-continue).
4. Saved → Success page.
5. Choose Pay on Spot (download RSVP) or Pay Online (→ Payment page).
