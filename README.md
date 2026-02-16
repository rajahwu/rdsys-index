# RADIANT SYSTEMS // _INDEX

**Central lattice infrastructure for the Radiant Systems ecosystem.**

## 🏗️ Architecture Overview
```
_index/
├── web/                    # Frontend lattice interface
│   ├── src/
│   │   ├── components/
│   │   │   ├── agents/     # AI agent sigils & lattice
│   │   │   ├── systems/    # Protocol registry & nodes
│   │   │   ├── terminal/   # Terminal & telemetry
│   │   │   └── shared/     # Reusable UI primitives
│   │   ├── hooks/          # React hooks (Supabase, HXTM, etc.)
│   │   ├── views/          # Page-level layouts
│   │   ├── utils/          # Engines (flux, HEV)
│   │   └── types/          # TypeScript definitions
│   └── public/             # Static assets
└── [Other subsystems TBD]
```

## 🧬 Core Systems

### **Web Interface**
- **Framework**: Vite + React 19 + TypeScript
- **Styling**: Tailwind CSS v4 + Clearline7 theme system
- **Data**: Supabase (real-time agent profiles & protocol nodes)
- **Routing**: React Router v6
- **Telemetry**: HXTM (Human Experience Tracking Module)

### **AI Agent Lattice**
Live coordination platform for 4 agents:
- **V-00 (VINCENT)**: Relic Master Systems Architect
- **G-01 (GEMINI)**: Architect // Soul Generator
- **D-02 (DEEPSEEK)**: Logician // Data Architect
- **P-03 (PERPLEXITY)**: Research // Intelligence Coordinator

### **Protocol Registry**
- L7_RDXT node management
- Paginated interface (no scrollbars)
- Live status monitoring
- Terminal integration

## 🚀 Quick Start
```bash
# Install dependencies
cd web
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

## 📡 Environment Setup

Create `web/.env` with:
```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_anon_key
```

## 🎯 Current Status

**SYSTEMS_ONLINE**: Web lattice v1.0  
**AGENTS_ACTIVE**: 4 nodes  
**PROTOCOL**: L7_RDXT  
**STATUS**: STABLE

---

## 📚 Documentation

- [Web Architecture](./web/README.md)
- [Component Structure](./web/src/components/README.md) *(TBD)*
- [Deployment Guide](./DEPLOY.md) *(TBD)*

---

*"A thing is what it is while it is." — Pilot Manual v0.1*
