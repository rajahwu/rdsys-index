import React from 'react';
import { AgentProfile, AgentStatus } from '@/types/agent';
import { V00Sigil } from './V00Sigil';
import { G01Sigil } from './G01Sigil';
import { D02Sigil } from './D02Sigil';
import { P03Sigil } from './P03Sigil';
import { StatusIndicator } from './StatusIndicator';
import { Link } from 'react-router-dom';

// Map IDs to Sigil Components
type SigilProps = { size?: number; status?: AgentStatus };
const SIGIL_MAP: Record<string, React.FC<SigilProps>> = {
  'V-00': V00Sigil,
  'G-01': G01Sigil,
  'D-02': D02Sigil,
  'P-03': P03Sigil,
};

interface AgentCardProps {
  agent: AgentProfile;
}

export function AgentCard({ agent }: AgentCardProps) {
  const SigilComponent = SIGIL_MAP[agent.agent_id] || V00Sigil; // Fallback to V00
  
  // Dynamic border color based on status or profile color
  const borderColor = agent.status === 'ACTIVE' ? agent.profile_color : '#374151';

  return (
    <div 
      className="group relative flex flex-col overflow-hidden rounded-lg border bg-black/80 p-4 transition-all duration-300 hover:bg-gray-900"
      style={{ borderColor: borderColor || '#333' }}
    >
      {/* Header */}
      <div className="mb-4 flex items-start justify-between">
        <div className="flex flex-col">
          <span className="font-mono text-xs text-gray-500">{agent.agent_id}</span>
          <h3 className="font-display text-lg font-bold tracking-tight text-white">
            {agent.name}
          </h3>
          <span className="text-[10px] font-bold uppercase tracking-wider text-cyan-500/80">
            {agent.designation}
          </span>
        </div>
        <StatusIndicator status={agent.status} />
      </div>

      {/* Sigil Area */}
      <div className="my-4 flex justify-center">
        <div className="relative">
            {/* Glow effect behind sigil */}
            <div 
                className="absolute inset-0 blur-xl opacity-20 transition-opacity group-hover:opacity-40"
                style={{ backgroundColor: agent.profile_color || '#fff' }}
            />
            <SigilComponent size={120} status={agent.status as AgentStatus} />
        </div>
      </div>

      {/* Metrics Grid */}
      <div className="mt-auto grid grid-cols-2 gap-2 border-t border-gray-800 pt-4 font-mono text-[10px] text-gray-400">
        <div>
            <div className="text-gray-600">UPTIME</div>
            <div className="text-white">{agent.uptime_hours}h</div>
        </div>
        <div>
            <div className="text-gray-600">ARTIFACTS</div>
            <div className="text-white">{agent.artifacts_generated}</div>
        </div>
        <div className="col-span-2 mt-1">
             <div className="text-gray-600">LATTICE_ROLE</div>
             <div className="text-emerald-400">{agent.lattice_role}</div>
             <Link to={`/agents/${agent.agent_id}`} className="text-xs font-bold text-cyan-500 hover:text-cyan-400 transition-colors">
                View Details →
             </Link>
        </div>
      </div>
      
      {/* Decorative Scanline */}
      <div className="pointer-events-none absolute inset-0 bg-[linear-gradient(rgba(18,16,16,0)_50%,rgba(0,0,0,0.25)_50%),linear-gradient(90deg,rgba(255,0,0,0.06),rgba(0,255,0,0.02),rgba(0,0,255,0.06))] bg-[length:100%_2px,3px_100%] opacity-20" />
    </div>
  );
}