import { useParams } from 'react-router-dom';
import { useAgentProfiles } from '@/hooks/useAgentProfiles';
import { Link } from 'react-router-dom';

export default function AgentDetailPage() {
  const { agentId } = useParams<{ agentId: string }>();
  const { agents, loading } = useAgentProfiles();
  
  const agent = agents.find(a => a.agent_id === agentId);
  
  if (loading) return <div className="p-10 font-mono opacity-50">LOADING_AGENT_PROFILE...</div>;
  if (!agent) return <div className="p-10 font-mono opacity-50">AGENT_NOT_FOUND</div>;
  
  return (
    <div className="min-h-screen bg-black text-white p-8">
      <nav className="mb-6">
        <Link to="/" className="text-sm text-cyan-500 hover:text-cyan-400 transition-colors">
          ← Back to Dashboard
        </Link>
      </nav>
      <header className="mb-8 border-b border-white/10 pb-4">
        <div className="flex items-center justify-between">
          <div>
            <span className="text-xs text-white/40 font-mono">{agent.agent_id}</span>
            <h1 className="text-3xl font-bold">{agent.name}</h1>
            <p className="text-sm text-cyan-400">{agent.designation}</p>
          </div>
          <div className="text-right">
            <div className="text-xs text-white/40">STATUS</div>
            <div className="text-lg font-bold text-rdxt-teal">{agent.status}</div>
          </div>
        </div>
      </header>

      <div className="grid grid-cols-3 gap-6">
        {/* Metrics Grid */}
        <div className="col-span-2 space-y-6">
          <section className="border border-white/10 p-6">
            <h2 className="text-sm font-bold mb-4 tracking-widest">PERFORMANCE_METRICS</h2>
            <div className="grid grid-cols-2 gap-4 font-mono text-sm">
              <div>
                <div className="text-white/40">Uptime</div>
                <div className="text-2xl text-white">{agent.uptime_hours}h</div>
              </div>
              <div>
                <div className="text-white/40">Artifacts Generated</div>
                <div className="text-2xl text-white">{agent.artifacts_generated}</div>
              </div>
            </div>
          </section>

          <section className="border border-white/10 p-6">
            <h2 className="text-sm font-bold mb-4 tracking-widest">LATTICE_ROLE</h2>
            <p className="text-sm text-emerald-400">{agent.lattice_role}</p>
          </section>
        </div>

        {/* Sidebar */}
        <div className="space-y-6">
          <section className="border border-white/10 p-6">
            <h2 className="text-sm font-bold mb-4 tracking-widest">AGENT_SIGIL</h2>
            {/* Render the sigil here */}
            <div className="flex justify-center">
              <div className="w-32 h-32 border border-white/10 flex items-center justify-center">
                [SIGIL]
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
}