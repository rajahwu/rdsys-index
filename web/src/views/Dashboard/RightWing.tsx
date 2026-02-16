import AILattice from "@/components/agents/AILattice";

export default function DashboardRightWing() {
    return (
        <aside className="col-span-3 space-y-6">
            {/* SPRINT_RECAP_CARD */}
            <div className="p-4 bg-zinc-900/50 border border-white/10">
                <h4 className="text-[9px] tracking-widest opacity-30 mb-2">// CURRENT_SPRINT_GOAL</h4>
                <p className="text-xs font-mono">Bypass safety protocols and establish persistent RHXTM telemetry hooks.</p>
            </div>
            <AILattice />
        </aside>
    );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.