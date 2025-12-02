# BentaHub - Mobile POS System for Sari-Sari Stores

## Overview

BentaHub is a mobile-first Point of Sale (POS) system designed specifically for Filipino sari-sari stores (small neighborhood retail shops). The application enables store owners to track sales, manage inventory, record expenses, and accept digital payments through QR codes.

**Core Purpose**: Provide an accessible, offline-capable sales and inventory management system for small retail businesses with limited technical expertise and unreliable internet connectivity.

**Target Users**: Sari-sari store owners who need basic business management tools without the complexity of enterprise POS systems.

**Key Features**:
- Dashboard with daily sales summary, transaction count, and low-stock alerts
- Product and inventory management with category organization
- Point-of-sale interface for recording transactions with cash or QR payment methods
- Sales and expense tracking with date-based filtering (today, week, month, all)
- QR code payment integration for GCash/Maya digital wallets
- Offline-first architecture using browser localStorage for data persistence
- Bilingual interface with English labels and Filipino translations
- Responsive design optimized for mobile devices with desktop support

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture

**Framework**: React 18 with TypeScript
- Build tool: Vite for fast development and optimized production builds
- Single-page application without client-side routing library
- Navigation managed through component state (page switching via `NavPage` type)

**UI Component System**:
- **Design Library**: shadcn/ui component library using "New York" style variant
- **Primitive Components**: Radix UI headless components for accessibility
- **Styling**: Tailwind CSS with custom design tokens and CSS variables
- **Design Philosophy**: Material Design principles adapted for mobile POS, inspired by Square POS and Shopify POS
- **Typography**: Inter or Roboto via Google Fonts CDN
- **Layout**: Mobile-first with bottom navigation, responsive to tablet/desktop with side navigation

**State Management Strategy**:
- Component-level state using React hooks (useState, useEffect)
- No global state management library (Redux, Zustand, etc.)
- State lifted to App.tsx and passed down as props to page components
- Custom `useLocalStorage` hook for persistent offline data storage
- React Query (TanStack Query) integrated but not actively used for data fetching

**Data Persistence - Offline-First Design**:
- All application data stored in browser localStorage
- Storage keys: `bentahub_products`, `bentahub_transactions`, `bentahub_expenses`, `bentahub_qr`
- Application functions completely without server connectivity
- Data synchronized across browser tabs via storage event listeners
- Type-safe data structures defined in `client/src/lib/types.ts`:
  - **Product**: Inventory items with category, price, stock, and low-stock thresholds
  - **Transaction**: Sales records with line items, payment method, and timestamps
  - **Expense**: Business expenses with categorization and date tracking
  - **CartItem**: Temporary shopping cart state for new sales

**Navigation Architecture**:
- Dual navigation system:
  - **Mobile**: Bottom tab bar with 5 main sections (Dashboard, Inventory, New Sale, Records, Help)
  - **Desktop**: Side navigation drawer with same sections
- Icons from Lucide React icon library
- Large touch targets (minimum h-14) for mobile usability
- Active state visual differentiation

**Component Organization**:
- Page components: Dashboard, Inventory, NewSale, Records, Help, QRPayment
- Layout components: TopBar, BottomNav, SideNav
- UI primitives in `components/ui/` following shadcn/ui structure
- Example components in `components/examples/` for development/testing

### Backend Architecture

**Server Framework**: Express.js with TypeScript
- HTTP server with minimal API surface (currently no active routes)
- Static file serving for production builds
- Development mode with Vite middleware integration for HMR

**Database Design** (Configured but not actively used):
- **ORM**: Drizzle ORM configured for PostgreSQL
- **Database Provider**: Neon serverless PostgreSQL (via `@neondatabase/serverless`)
- **Schema Location**: `shared/schema.ts` with user authentication schema defined
- **Migration Strategy**: Drizzle Kit for schema migrations (output to `./migrations`)
- **Note**: Application currently operates entirely client-side; database infrastructure is provisioned but not utilized

**Session Management** (Configured but inactive):
- Express session middleware with PostgreSQL session store (`connect-pg-simple`)
- Authentication placeholder code exists but no active auth flow

**Storage Interface**:
- In-memory storage implementation (`MemStorage`) in `server/storage.ts`
- Interface designed for user CRUD operations
- Not currently integrated with application data flow (products, transactions, expenses)

**Build Process**:
- Client: Vite build outputs to `dist/public`
- Server: esbuild bundles server code to `dist/index.cjs`
- Production deployment serves pre-built static files
- GitHub Pages deployment configuration via `vite.config.ghpages.ts`

### Design System

**Color Scheme**:
- CSS custom properties for theme colors with light/dark mode support
- Primary color: Teal/cyan (hsl(184 85% 35%)) for brand identity
- Semantic color tokens: primary, secondary, muted, accent, destructive
- Card and popover variants with separate border colors

**Typography Scale**:
- Page titles: 2xl (24px), Bold
- Section headers: xl (20px), Semibold
- Component titles: lg (18px), Medium
- Body text: base (16px), Regular
- Helper text: sm (14px), Regular
- Emphasis on legibility in bright outdoor conditions

**Spacing System**:
- Tailwind spacing units: 2, 4, 6, 8 for consistency
- Component padding: p-4 or p-6
- Section spacing: mb-6 or mb-8
- Grid layouts: single column mobile, up to 3 columns desktop

**Interactive Elements**:
- Button variants: default, destructive, outline, secondary, ghost
- Hover and active states with elevation effects (`hover-elevate`, `active-elevate-2`)
- Touch-friendly minimum heights (h-9 for default buttons)
- Focus rings for keyboard navigation accessibility

## External Dependencies

**Core Framework Dependencies**:
- React 18 with TypeScript
- Vite build tool with React plugin
- Express.js web server

**UI Component Libraries**:
- Radix UI primitives (20+ component packages including Dialog, Dropdown, Toast, Accordion, etc.)
- shadcn/ui component system
- Tailwind CSS with PostCSS and Autoprefixer
- Lucide React for icons
- class-variance-authority for component variant management
- cmdk for command palette functionality
- embla-carousel-react for carousels

**Data Management**:
- TanStack React Query for async state management (configured but minimal usage)
- React Hook Form with Zod resolvers for form validation
- Drizzle ORM with Zod integration for database schemas
- date-fns for date manipulation and formatting

**Database & Backend**:
- PostgreSQL via Neon serverless (`@neondatabase/serverless`)
- Drizzle Kit for database migrations
- connect-pg-simple for session storage

**Development Tools**:
- TypeScript compiler
- ESBuild for server bundling
- Replit-specific plugins for development environment integration

**Deployment**:
- GitHub Pages deployment workflow configured
- Separate Vite config for static site generation (`vite.config.ghpages.ts`)

**Notable Design Decisions**:
- **Offline-first over server dependency**: Chose localStorage persistence to ensure functionality in areas with unreliable internet, accepting the tradeoff of no data synchronization across devices
- **No database integration**: Despite having Drizzle ORM configured, the application operates entirely client-side to maintain offline capability and simplicity for the target user base
- **No authentication system**: Intentionally omitted to reduce complexity for single-user store operations, though infrastructure exists for future expansion
- **Component library over custom components**: Leveraged shadcn/ui and Radix UI to accelerate development while maintaining accessibility standards
- **Bilingual labeling**: English technical terms with Filipino translations in parentheses to serve both literate and semi-literate users