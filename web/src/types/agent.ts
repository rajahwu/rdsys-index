export type AgentStatus = 'ACTIVE' | 'IDLE' | 'STALE' | 'OFFLINE';

export interface AgentMetrics {
  sessions_active: number;
  artifacts_generated: number;
  uptime_hours: number;
  last_active: string; // ISO timestamp
}

export interface AgentCapabilities {
  primary: string;
  secondary: string[];
  constraints?: string[];
}

export interface AgentProfile {
  agent_id: string; // PK
  name: string;
  designation: string; // e.g., "RELIC MASTER // SYSTEMS ARCHITECT"
  status: AgentStatus;
  lattice_role: string;
  
  // JSONB fields in SQL, mapped here
  specialization: string[]; 
  capabilities: AgentCapabilities;
  
  // Flattened metrics from DB columns
  sessions_active: number;
  artifacts_generated: number;
  uptime_hours: number;
  last_active: string;

  profile_image?: string;
  profile_color?: string; // hex
  auth_signature?: string;
  
  linked_corelink_id?: string;
}