import { useHXTM } from "@/hooks/useHXTM";

export default function DashboardHeader() {
    const { energy, isActive, elapsed } = useHXTM();

    return (
        <header className="flex justify-between items-start mb-8 border-b border-white/5 pb-4">
            <div>
                <h1 className="text-2xl font-black tracking-widest">SINE_REIN_COMMAND</h1>
                <p className="text-[10px] opacity-40 font-mono">LOCATION: LOCALHOST // SECTOR: RAD-7</p>
            </div>
            <div className="text-right">
                <div className="text-xl font-mono">{new Date().toLocaleTimeString()}</div>
                <div className="text-[9px] text-rdxt-teal opacity-60">
                    {isActive ? `SESSION_IN_PROGRESS: ${Math.floor(elapsed / 60)}M` : 'SYSTEM_IDLE'}
                </div>
            </div>
        </header>
    );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.