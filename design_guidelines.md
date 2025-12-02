# BentaHub Design Guidelines

## Design Approach: Utility-First POS System

**Selected Framework**: Material Design principles adapted for mobile POS
**Inspiration**: Square POS, Shopify POS - prioritizing speed, clarity, and touch-friendly interactions
**Core Principle**: Every tap should feel productive. No decorative elements that slow down transactions.

## Typography System

**Primary Font**: Inter or Roboto (Google Fonts CDN)
**Secondary Font**: Same family for consistency

**Hierarchy**:
- Page Titles: 2xl (24px), Bold (700)
- Section Headers: xl (20px), Semibold (600)
- Card/Component Titles: lg (18px), Medium (500)
- Body Text: base (16px), Regular (400)
- Helper Text/Captions: sm (14px), Regular (400)
- Numbers (Sales, Prices): xl-2xl, Semibold - larger for quick scanning

**Special Consideration**: All text must be highly legible on small screens in bright outdoor conditions (sari-sari stores)

## Layout System

**Spacing Primitives**: Use Tailwind units of 2, 4, 6, and 8 for consistency
- Component padding: p-4 or p-6
- Section spacing: mb-6 or mb-8
- Button padding: px-6 py-3
- Form element spacing: gap-4

**Grid System**:
- Mobile (default): Single column, full-width components
- Tablet (md:): 2-column layout for dashboard cards only
- Desktop: Maximum 3-column for dashboard widgets

**Container Strategy**:
- Mobile: Full-width with px-4 horizontal padding
- Desktop: max-w-7xl centered

## Navigation Structure

**Primary Navigation**: Bottom tab bar (mobile) / Side drawer (desktop)
- 5 main tabs: Dashboard, Inventory, New Sale, Records, Help
- Icons from Heroicons (outline style)
- Large touch targets: h-14 minimum
- Active state clearly distinguished

**Secondary Navigation**: Top app bar
- Store name/logo left-aligned
- Today's date centered
- Menu/Settings icon right-aligned
- h-16 for comfortable touch

## Component Library

### Dashboard Cards
- Card container: rounded-lg border with p-6
- Metric display: Large number (3xl, bold) + small label below
- Icon positioned top-right corner
- 3 primary metrics: Today's Sales, Transactions, Low Stock Count
- Stack vertically on mobile, 2-3 columns on tablet/desktop

### Inventory Table/List
- Mobile: Card-based list (not table)
  - Product name (lg, semibold)
  - Price and stock on same line (base)
  - Category badge (sm)
  - Edit/Delete icons right-aligned
- Desktop: Traditional table with sortable columns
- Search bar at top: h-12, rounded-lg, prominent
- "Add Product" button: floating action button (bottom-right on mobile)

### New Sale Interface
**Product Selection**:
- Large search/dropdown: h-14, prominent at top
- Selected items list: Cards showing product, quantity stepper, subtotal
- Quantity stepper: Large -/+ buttons (min h-12 w-12)

**Cart Summary Panel**:
- Sticky at bottom on mobile
- Sidebar on desktop
- Total display: 3xl, bold, highly visible
- Payment type: Large radio buttons with icons (Cash/QR)
- Cash payment: Amount received input + Change due (2xl)
- "Complete Sale" button: Full-width, h-14, prominent

### Transaction Records
- Date filter: Top bar with preset ranges (Today, This Week, This Month)
- List view on mobile: Card per transaction
  - Time stamp (sm)
  - Total amount (xl, semibold)
  - Item count + payment method
- Table view on desktop
- Pull-to-refresh gesture on mobile

### QR Payment Page
- Centered layout
- QR code image: max-w-sm, centered, prominent
- Instructions in Taglish: Base text, clear steps
- "How to Pay" accordion section below
- Option to upload custom QR: Simple file input with preview

### Expense Tracker
- Quick add form at top
- List of recent expenses below
- Monthly total prominently displayed
- Category tags for filtering

### Help/Training Page
- Accordion sections for different features
- Step-by-step numbered guides
- External links to DTI programs: Clear CTA buttons
- Simple illustrations or icons for each section

## Forms and Inputs

**All Form Elements**:
- Minimum height: h-12 (48px)
- Large touch targets for mobile
- Clear labels above inputs
- Border-style inputs with rounded corners
- Error states: Red accent with helper text below

**Buttons**:
- Primary actions: h-12 or h-14, rounded-lg, bold text
- Secondary actions: h-10, outlined style
- Destructive actions: Red accent, outlined
- Icon-only buttons: Minimum 44x44px

## Mobile-First Considerations

**Touch Targets**: All interactive elements minimum 44x44px
**Spacing**: Generous padding between tappable elements (minimum gap-4)
**Scrolling**: Natural scroll behavior, no fixed heights except navigation
**Landscape Support**: Graceful reflow on orientation change

## Offline Indicators

**Connection Status**: Small badge in top app bar
- Online: Subtle green dot
- Offline: Yellow dot with "Offline Mode" text
- Last sync time displayed

## Data Visualization

**Sales Charts** (if implemented):
- Simple bar charts for daily/weekly sales
- Use Chart.js or similar via CDN
- Mobile: Stack charts vertically
- Desktop: 2-column layout

**Product Performance**:
- Simple ranked list with numbers
- No complex visualizations needed

## Responsive Breakpoints

- Mobile: 0-640px (base styles)
- Tablet: 641px-1024px (md:)
- Desktop: 1025px+ (lg:)

**Key Behavior Changes**:
- Navigation: Bottom tabs → Side drawer
- Lists: Cards → Tables
- Single column → Multi-column for dashboard

## Images

No hero images needed for this application. This is a utility tool, not a marketing site.

**Functional Images Only**:
- QR payment code: User-uploaded or placeholder
- Product thumbnails: Optional, small (64x64px)
- Help section: Simple instructional icons from Heroicons

## Performance Priorities

- Fast load times critical for store environments
- Minimize external dependencies
- LocalStorage for all data
- No heavy animations or transitions
- Instant feedback on all interactions

## Accessibility

- High contrast text ratios for outdoor visibility
- Large, clear typography
- Keyboard navigation support for desktop
- ARIA labels for all interactive elements
- Focus indicators clearly visible