# _index/web Refactor TODO

## Refactor Status: In Progress ✓

The web app has been successfully restructured into a proper `src/` directory with modern tooling:
- **Vite** for bundling
- **React 19** with TypeScript
- **Tailwind CSS v4** for styling
- **React Router v6** for client-side routing
- **Clearline7 theme system** for design tokens
- **Supabase** integration for live data

---

## Architecture Overview

```
src/
├── main.tsx           # Entry point with BrowserRouter
├── views/             # Page-level views
│   └── DashboardView.tsx
├── pages/             # Route-specific pages
│   ├── SystemPage.tsx
│   └── TestAgents.tsx
├── components/        # Reusable UI components
│   ├── agents/        # AI agent sigils & lattice
│   ├── systems/       # System registry & cards
│   ├── terminal/      # Terminal & instrument clusters
│   └── shared/        # Shared UI primitives
├── hooks/             # Custom React hooks
│   ├── useHXTM.ts        # Human experience telemetry (energy, hydration)
│   ├── useSubsystems.ts  # Live system nodes from Supabase
│   ├── useAgentProfiles/ # AI agent profiles
│   ├── useCoreLinks.ts   # Protocol node linking
│   └── useIdentityMarkers.ts
├── utils/             # Helper functions & engines
│   ├── flux-engine.ts     # Tonal strategy calculator
│   ├── hev-engine.ts      # Human Experience Value calculator
│   ├── parseMissionQuiz.ts
│   └── ...
├── lib/               # External integrations
│   ├── supabaseClient.ts
│   └── utils.ts
├── types/             # TypeScript definitions
│   ├── agent.ts
│   ├── corelink.ts
│   └── marker.ts
├── styles/            # Stylesheet modules
│   ├── agent.css
│   ├── terminal.css
│   └── relic-tokens.css
└── data/              # Static data & configs
    └── telemtry-manifest.json
```

---

## Critical Action Items

### 1. **Fix import path aliases** 🔴 HIGH PRIORITY
DashboardView imports components with incorrect alias:
```tsx
// ❌ CURRENT (wrong):
import InstrumentCluster from '@/components/InstrumentCluster';
import AILattice from '@/components/AILattice';
import SystemsIndex from '@/components/SystemsIndex';

// ✅ SHOULD BE:
import InstrumentCluster from '@/components/terminal/InstrumentCluster';
import AILattice from '@/components/agents/AILattice';
import SystemsIndex from '@/components/systems/SystemsIndex';
```
**Impact**: Components likely fail to load; app may crash on dashboard render.

### 2. **Fix relative imports in DashboardView** 🔴 HIGH PRIORITY
SystemPage incorrectly imports components:
```tsx
// ❌ CURRENT:
import SystemHeader from '@/components/SystemHeader';
import SystemTerminal from '@/components/SystemTerminal';

// ✅ SHOULD BE:
import SystemHeader from '@/components/systems/SystemHeader';
import SystemTerminal from '@/components/terminal/SystemTerminal';
```

### 3. **Stabilize component exports** 🟡 MEDIUM PRIORITY
Several components may have missing/inconsistent exports:
- [ ] SystemsIndex.tsx - exports default; verify re-exports work
- [ ] ProtocolRegistry - verify onNodeSelect callback signature
- [ ] SystemTerminal - verify node prop typing matches useSubsystems output
- [ ] InstrumentCluster - verify energy state management hook integration

**Action**: Run TypeScript compiler to catch missing re-exports:
```bash
npm run build
```

### 4. **Resolve empty components** 🟡 MEDIUM PRIORITY
- `AgentLattice.tsx` - **EMPTY** - deprecated? Used in legacy flow?
  - [ ] Determine if needed (replace with AILattice?)
  - [ ] Delete if unused, or populate with proper content

**Search for usage**:
```bash
grep -r "AgentLattice" src/
```

### 5. **Validate Supabase integration** 🟡 MEDIUM PRIORITY
- [ ] `useSubsystems.ts` - Verify `supabaseClient` connection works
- [ ] `useAgentProfiles.ts` - Check real-time subscription setup
- [ ] `useRealtimeAgentProfiles.ts` - Verify realtime listener doesn't duplicate
- [ ] `.env` file - Confirm VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY are set

**Action**: Check connection on app load:
```bash
npm run dev  # Watch console for Supabase errors
```

### 6. **CSS & styling integration** 🟡 MEDIUM PRIORITY
Current CSS structure:
- `src/styles/` contains modular stylesheets (agent.css, terminal.css, relic-tokens.css)
- `public/css/` contains global sheets (app.css, radiant-systems.css)
- Tailwind v4 handles most styling but edge cases exist

**Action**:
- [ ] Audit CSS imports in components (verify @import chains work)
- [ ] Remove duplicate class definitions
- [ ] Integrate relic-tokens.css into Tailwind theme
- [ ] Test dark mode persistence (localStorage backup)

### 7. **Router setup & page transitions** 🟡 MEDIUM PRIORITY
Current state:
- BrowserRouter wraps DashboardView only
- SystemPage component exists but no route defined
- No navigation implementation between views

**Action**:
- [ ] Create Routes structure in DashboardView or separate router config
- [ ] Link SystemPage to routes (e.g., `/system/:id`)
- [ ] Implement breadcrumb navigation
- [ ] Test back button behavior

### 8. **Hook standardization** 🟡 MEDIUM PRIORITY
Multiple data hooks exist; some may conflict:
- `useAgentProfiles.ts` (static fetch)
- `useRealtimeAgentProfiles.ts` (live listener)

**Action**:
- [ ] Choose one as canonical source for agents
- [ ] Consolidate into single hook with optional realtime flag
- [ ] Update all components to use unified hook
- [ ] Remove duplicate/redundant hooks

### 9. **Type safety across component tree** 🟢 LOW PRIORITY
- [ ] Ensure all `useSubsystems` return types match SystemTerminal node prop
- [ ] Verify marker.ts, corelink.ts, agent.ts types match Supabase schema
- [ ] Add stricter null checking in conditional renders

### 10. **Environment variables & secrets** 🟢 LOW PRIORITY
- [ ] Create `.env.example` with required vars:
  ```
  VITE_SUPABASE_URL=
  VITE_SUPABASE_ANON_KEY=
  ```
- [ ] Document setup in README

---

## Next Steps (After critical fixes)

### Phase 1: Stability (Days 1-2)
1. Fix all import aliases (items 1-2)
2. Run TypeScript compiler; fix type errors
3. Test dashboard renders without crashes
4. Verify Supabase connection works

### Phase 2: Integration (Days 3-4)
5. Set up routing properly
6. Consolidate hooks
7. Test component interop
8. Verify realtime data flows work

### Phase 3: Polish (Days 5-6)
9. Audit & merge CSS
10. Add environment setup docs
11. Performance testing (bundle size, load time)
12. Accessibility audit (WCAG 2.1 AA)

### Phase 4: Documentation (Ongoing)
- [ ] Update README with new src structure
- [ ] Add component storybook entries for key UI pieces
- [ ] Document hook lifecycle & data flow diagram
- [ ] Add comments for complex logic (flux-engine, hev-engine)

---

## Dependencies Status

### ✅ Up to date
- React 19.2.4
- React DOM 19.2.4
- React Router 6.25.1
- Vite 7.3.1
- TypeScript 5.9.3
- Tailwind CSS 4.1.18

### ⚠️ Worth reviewing
- `@clearline7/*` packages (private scope; verify access)
- `@supabase/supabase-js` (2.95.3 is recent; check breaking changes in major versions)

---

## Testing Checklist

- [ ] Dashboard loads without errors
- [ ] Systems registry displays live nodes
- [ ] Agent lattice shows AI team status
- [ ] Terminal displays correctly on node select
- [ ] Energy level buttons toggle state
- [ ] Hydration timer alerts work
- [ ] Dark theme applies consistently
- [ ] Mobile responsive layout works (grid cols adjust)
- [ ] Supabase realtime subscriptions active
- [ ] localStorage persists telemetry state

---

## Notes & Observations

1. **Philosophical naming**: Component names are thematic (HXTM, flux-engine, Sigil, Lattice)—maintain this consistency when adding new features.

2. **Placeholder components**: No obvious placeholder dirs (good!). AgentLattice.tsx is the only empty file—needs decision.

3. **CSS organization**: Files are well-modularized; consider moving all CSS to Tailwind directives for consistency.

4. **Local data**: `data/telemtry-manifest.json` exists but likely unused now that Supabase is live. Verify and remove if redundant.

5. **DevDX improvements**: Consider adding:
   - ESLint + Prettier config
   - Pre-commit hooks (husky)
   - GitHub Actions CI/CD

---

**Last reviewed**: Feb 16, 2026  
**Status**: Refactor functional; needs import path fixes before deploy
