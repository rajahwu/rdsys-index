import React from 'react';
import { V00Sigil } from './V00Sigil';
import { G01Sigil } from './G01Sigil';
import { D02Sigil } from './D02Sigil';
import { P03Sigil } from './P03Sigil';
import { AgentProfile, AgentStatus } from '@/types/agent'; 

// Define the prop type the Map expects
type SigilProps = { size?: number; status?: AgentStatus };

const SIGIL_MAP: Record<string, React.FC<SigilProps>> = {
  'V-00': V00Sigil as React.FC<SigilProps>,
  'G-01': G01Sigil as React.FC<SigilProps>,
  'D-02': D02Sigil as React.FC<SigilProps>,
  'P-03': P03Sigil as React.FC<SigilProps>,
};

export const Sigil = ({ agent_id, size, status }: { 
  agent_id: string; 
  size?: number; 
  status?: AgentStatus 
}) => {
  // Default to V00Sigil if the ID isn't found
  const SigilComponent = SIGIL_MAP[agent_id] || V00Sigil;

  return <SigilComponent size={size} status={status} />;
};

export default Sigil;