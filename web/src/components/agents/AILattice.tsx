import { useAgentProfiles } from '@/hooks/useAgentProfiles';
import { AgentCard } from '@/components/agents/AgentCard';

export default function AILattice() {
  const { agents, loading, error } = useAgentProfiles();

  if (loading) {
    return (
      <div className="flex h-64 w-full items-center justify-center border border-dashed border-gray-700 bg-gray-900/50 p-4 font-mono text-cyan-500">
        <span className="animate-pulse">{">>"} ESTABLISHING UPLINK TO AGENT REGISTRY...</span>
      </div>
    );
  }

  if (error) {
  // Cast to 'any' to bypass the 'never' inference
  const errorMessage = typeof error === 'string' ? error : (error as any).message || 'UNKNOWN_LATTICE_ERROR';
  
  return (
    <div className="p-4 text-red-500 text-[10px] font-mono border border-red-900/50 bg-red-950/10">
      {">>"} LATTICE_OFFLINE: {errorMessage}
    </div>
  );
}
  
  return (
    <div className="flex flex-col gap-6">
      <div className="flex items-center justify-between border-b border-gray-800 pb-2">
        <h2 className="font-mono text-sm font-bold tracking-widest text-gray-400">
          // AI_TEAM_LATTICE
        </h2>
        <span className="font-mono text-xs text-emerald-500">
          ● SYSTEM_ACTIVE [{agents.length} NODES]
        </span>
      </div>

      <div className="grid grid-cols-1 gap-6">
        {agents.map((agent) => (
          <AgentCard key={agent.agent_id} agent={agent} />
        ))}
      </div>
    </div>
  );
}