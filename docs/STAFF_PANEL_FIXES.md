# Staff Panel Fixes

## Issues Fixed

### 1. Amount Not Showing
**Problem**: The amount column was showing `₹0` for all users.

**Root Cause**: The code was looking for `reg.amount` field which doesn't exist in the database.

**Solution**: 
- Now checks multiple sources for amount data:
  1. `reg.totalAmount` (primary source)
  2. `events.totalAmount` (from eventSelections collection)
  3. Calculate from `eventCount * 100` (fallback)
- Applied to both table view and modal detail view

### 2. Events Showing as "Unknown Event"
**Problem**: Event names were displaying as "Unknown Event" in the modal.

**Root Cause**: The event object structure varies, and the code was only checking `event.eventName` and `event.name`.

**Solution**:
- Enhanced event name extraction to check multiple fields:
  - `event.eventTitle` (primary)
  - `event.eventName`
  - `event.eventId`
  - `event.name`
  - `event.title`
- Applied to:
  - User details modal
  - Event chart
  - Table rendering

### 3. Additional Improvements

#### Event Data Sources
Now checks multiple sources for event data:
1. `eventSelections` collection (via Map lookup by token)
2. `reg.eventSelections` (embedded in registration)
3. `reg.events` (legacy field)

#### Team Size Display
Enhanced to check multiple fields:
- `event.participantCount`
- `event.teamSize`
- `event.team`
- `event.quantity`

#### Payment Type Detection
Improved to handle both field names:
- `reg.paymentMode` (new)
- `reg.paymentMethod` (legacy)

Handles values:
- Online: `online`, `upi`, or `paymentStatus === 'paid'`
- On-spot: `onspot`, `on-spot`, `offline`, `cash`, `manual`

## Technical Details

### Data Flow
```
Registration Document
├── totalAmount (preferred)
├── eventCount (for calculation)
├── eventSelections (embedded events)
└── shortId/tokenNo (for lookup)
        ↓
EventSelections Collection (lookup by token)
├── totalAmount
├── selections[] (event list)
│   ├── eventTitle
│   ├── participantCount
│   └── ...
└── eventCount
```

### Field Priority
1. **Amount**: `totalAmount` → `eventCount * 100`
2. **Event Name**: `eventTitle` → `eventName` → `eventId` → `name` → `title`
3. **Team Size**: `participantCount` → `teamSize` → `team` → `quantity` → `1`

## Testing Checklist
- [x] Amount displays correctly in table
- [x] Amount displays correctly in modal
- [x] Event names show properly (not "Unknown Event")
- [x] Event chart displays correct event names
- [x] Team size shows correctly
- [x] Payment type displays correctly
- [x] Works with both embedded and separate event data

## Files Modified
- `admin/staff-panel.html` - Fixed amount calculation and event name extraction
