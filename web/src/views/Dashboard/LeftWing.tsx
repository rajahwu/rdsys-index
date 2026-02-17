import InstrumentCluster from '@/components/instruments/telemetry/InstrumentCluster';

export default function DashboardLeftWing() {
    return (
        <aside className="col-span-3 space-y-6">
            <InstrumentCluster />
            <div className="p-4 border border-white/5 opacity-40 text-[10px] leading-relaxed italic">
                "A thing is what it is while it is."
                <br />— Pilot Manual v0.1
            </div>
        </aside>
    );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.