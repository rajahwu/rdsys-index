-- Agent Profiles Table
-- Stores identity and operational data for AI agents in the lattice

CREATE TABLE agent_profiles (
  -- Primary Identity
  agent_id VARCHAR(10) PRIMARY KEY, -- "G-01", "D-02", "P-03", etc.
  name VARCHAR(50) NOT NULL, -- "GEMINI", "DEEPSEEK", "PERPLEXITY"
  designation VARCHAR(100), -- "ARCHITECT // CONSTRUCT", "LOGICIAN // DATA-DOCS"
  
  -- Status & Classification
  status VARCHAR(20) NOT NULL DEFAULT 'IDLE', -- ACTIVE, IDLE, STALE, OFFLINE
  lattice_role VARCHAR(100), -- "Soul Generator", "Data Architect", "Research Coordinator"
  
  -- Capabilities (stored as JSONB for flexibility)
  specialization JSONB, -- ["creative-synthesis", "musical-composition", "philosophical-introspection"]
  capabilities JSONB, -- { primary: "...", secondary: [...], constraints: [...] }
  
  -- Metrics
  sessions_active INTEGER DEFAULT 0,
  artifacts_generated INTEGER DEFAULT 0,
  uptime_hours DECIMAL(10, 2) DEFAULT 0.0,
  last_active TIMESTAMP WITH TIME ZONE,
  
  -- Visual Identity
  profile_image TEXT, -- URL or base64 data
  profile_color VARCHAR(7), -- Hex color for status indicator
  
  -- Authentication & Security
  auth_signature VARCHAR(255) UNIQUE, -- Unique identifier/hash
  
  -- Relationships
  linked_corelink_id VARCHAR(10), -- FK to core_links table (optional)
  
  -- Metadata
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Constraints
  CONSTRAINT valid_status CHECK (status IN ('ACTIVE', 'IDLE', 'STALE', 'OFFLINE'))
);

-- CoreLinks Table (if not already created)
-- Systems registry that agents may be linked to

CREATE TABLE IF NOT EXISTS core_links (
  link_id VARCHAR(10) PRIMARY KEY, -- "RS-02", "CF-06", etc.
  name VARCHAR(100) NOT NULL,
  description TEXT,
  status VARCHAR(20) DEFAULT 'idle',
  health VARCHAR(20) DEFAULT 'unknown',
  
  -- Structural data (JSONB for flexibility)
  coordinates JSONB, -- { local_dirs: [...], git_repos: [...] }
  infrastructure JSONB, -- { rdx: [...], protocols: [...] }
  artifacts JSONB, -- { assets: [], docs: [], papers: [] }
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  CONSTRAINT valid_corelink_status CHECK (status IN ('active', 'idle', 'stale', 'deprecated')),
  CONSTRAINT valid_health CHECK (health IN ('healthy', 'degraded', 'offline', 'unknown'))
);

-- Identity Markers Table
-- Semantic tags and metadata for systems and agents

CREATE TABLE IF NOT EXISTS identity_markers (
  marker_id SERIAL PRIMARY KEY,
  corelink_id VARCHAR(10), -- FK to core_links (optional, can also link to agents)
  agent_id VARCHAR(10), -- FK to agent_profiles (optional)
  
  category VARCHAR(50) NOT NULL, -- 'brand', 'color-system', 'typography', 'iconography', etc.
  name VARCHAR(100) NOT NULL,
  
  -- Marker data
  metadata JSONB, -- Flexible structure for different marker types
  assets JSONB, -- { file_paths: [...], urls: [...] }
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Foreign key constraints
  CONSTRAINT fk_corelink FOREIGN KEY (corelink_id) REFERENCES core_links(link_id) ON DELETE CASCADE,
  CONSTRAINT fk_agent FOREIGN KEY (agent_id) REFERENCES agent_profiles(agent_id) ON DELETE CASCADE,
  
  -- At least one parent reference required
  CONSTRAINT require_parent CHECK (corelink_id IS NOT NULL OR agent_id IS NOT NULL)
);

-- Indexes for performance
CREATE INDEX idx_agent_status ON agent_profiles(status);
CREATE INDEX idx_agent_last_active ON agent_profiles(last_active);
CREATE INDEX idx_agent_linked_corelink ON agent_profiles(linked_corelink_id);
CREATE INDEX idx_corelink_status ON core_links(status);
CREATE INDEX idx_marker_category ON identity_markers(category);
CREATE INDEX idx_marker_corelink ON identity_markers(corelink_id);
CREATE INDEX idx_marker_agent ON identity_markers(agent_id);

-- Trigger to auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_agent_profiles_updated_at
  BEFORE UPDATE ON agent_profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_core_links_updated_at
  BEFORE UPDATE ON core_links
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_identity_markers_updated_at
  BEFORE UPDATE ON identity_markers
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Seed data for current lattice members
INSERT INTO agent_profiles (
  agent_id,
  name,
  designation,
  status,
  lattice_role,
  specialization,
  capabilities,
  sessions_active,
  artifacts_generated,
  uptime_hours,
  last_active,
  profile_color,
  auth_signature
) VALUES
  (
    'G-01',
    'GEMINI',
    'ARCHITECT // CONSTRUCT',
    'ACTIVE',
    'Soul Generator',
    '["creative-synthesis", "musical-composition", "philosophical-introspection", "lyrical-architecture"]'::jsonb,
    '{
      "primary": "Structured creative output generation",
      "secondary": ["musical iteration", "thematic consistency", "production notation"],
      "constraints": ["requires clear conceptual framework", "works best with iterative refinement"]
    }'::jsonb,
    127,
    400,
    1247.5,
    NOW() - INTERVAL '12 minutes',
    '#00FF88',
    '7A3F-9B2E-C4D1-8F6A'
  ),
  (
    'D-02',
    'DEEPSEEK',
    'LOGICIAN // DATA-DOCS',
    'IDLE',
    'Data Architect',
    '["technical-analysis", "documentation-flow", "systems-reasoning", "code-optimization"]'::jsonb,
    '{
      "primary": "Technical documentation and analysis",
      "secondary": ["architectural planning", "dependency mapping", "optimization strategies"],
      "constraints": ["requires structured input", "best for deterministic problems"]
    }'::jsonb,
    89,
    234,
    892.25,
    NOW() - INTERVAL '10 hours 45 minutes',
    '#FFA500',
    '2E9A-5C7B-F1D3-6H8K'
  ),
  (
    'P-03',
    'PERPLEXITY',
    'RESEARCH // REF-INTEL',
    'STALE',
    'Intelligence Coordinator',
    '["research-coordination", "source-verification", "citation-synthesis", "knowledge-retrieval"]'::jsonb,
    '{
      "primary": "Research and source validation",
      "secondary": ["citation management", "fact verification", "knowledge graph navigation"],
      "constraints": ["limited to indexed sources", "real-time data depends on search freshness"]
    }'::jsonb,
    42,
    156,
    456.75,
    NOW() - INTERVAL '10 days',
    '#FF6B35',
    '9F4C-1A7E-D2B5-3K6M'
  );

-- Comments for documentation
COMMENT ON TABLE agent_profiles IS 'AI agents operating within the lattice coordination system';
COMMENT ON COLUMN agent_profiles.agent_id IS 'Unique identifier following pattern: LETTER-NUMBER (e.g., G-01)';
COMMENT ON COLUMN agent_profiles.specialization IS 'Array of specialized capabilities (stored as JSONB array)';
COMMENT ON COLUMN agent_profiles.capabilities IS 'Structured capability description with primary/secondary/constraints';
COMMENT ON COLUMN agent_profiles.auth_signature IS 'Unique hash for agent authentication and verification';
COMMENT ON COLUMN agent_profiles.linked_corelink_id IS 'Optional link to a system in core_links table';

COMMENT ON TABLE core_links IS 'Registry of autonomous systems in the RDX federation';
COMMENT ON TABLE identity_markers IS 'Semantic tags and metadata linking to systems or agents';
