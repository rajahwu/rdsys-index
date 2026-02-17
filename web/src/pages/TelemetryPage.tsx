import { useHXTM } from '@/hooks/useHXTM';
import { Link } from 'react-router-dom';

export default function TelemetryPage() {
  const { energy, isActive, elapsed } = useHXTM();

  return (
    <div className="min-h-screen bg-black text-white p-8">
      <nav className="mb-6">
        <Link to="/" className="text-sm text-cyan-500 hover:text-cyan-400 transition-colors">
          ← Back to Dashboard
        </Link>
      </nav>
      <header className="mb-8 border-b border-white/10 pb-4">
        <h1 className="text-3xl font-bold">HUMAN_TELEMETRY_DASHBOARD</h1>
        <p className="text-xs text-white/40 mt-1">HXTM_MONITORING_INTERFACE</p>
      </header>

      <div className="grid grid-cols-3 gap-6">
        {/* Energy Status */}
        <section className="border border-white/10 p-6">
          <h2 className="text-sm font-bold mb-4 tracking-widest">ENERGY_LEVEL</h2>
          <div className="text-4xl font-mono">{energy}</div>
          <div className="text-xs text-white/40 mt-2">Current operational capacity</div>
        </section>

        {/* Session Status */}
        <section className="border border-white/10 p-6">
          <h2 className="text-sm font-bold mb-4 tracking-widest">SESSION_STATUS</h2>
          <div className="text-2xl font-mono">
            {isActive ? 'ACTIVE' : 'IDLE'}
          </div>
          <div className="text-xs text-white/40 mt-2">
            Elapsed: {Math.floor(elapsed / 60)}m
          </div>
        </section>

        {/* Hydration Sync */}
        <section className="border border-white/10 p-6">
          <h2 className="text-sm font-bold mb-4 tracking-widest">HYDRATION_SYNC</h2>
          <div className="text-sm text-white/60">[CRITICAL]</div>
          <div className="text-xs text-white/40 mt-2">Log fluid intake reminder</div>
        </section>
      </div>

      {/* Historical Data Placeholder */}
      <section className="mt-8 border border-white/10 p-6">
        <h2 className="text-sm font-bold mb-4 tracking-widest">HISTORICAL_TRENDS</h2>
        <div className="h-64 flex items-center justify-center text-white/20 font-mono text-xs">
          [CHART_VISUALIZATION_PENDING]
        </div>
      </section>
    </div>
  );
}