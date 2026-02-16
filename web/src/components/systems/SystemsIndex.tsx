import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { SetDefinitionProvider } from '@clearline7/theme';
import { TechDocs } from '@clearline7/set-definitions';
import { useSubsystems } from '@/hooks/useSubsystems';
import ProtocolRegistry from '@/components/systems/ProtocolRegistry';
import SystemTerminal from '@/components/terminal/SystemTerminal';

const SystemsIndex: React.FC = () => {
  const { nodes, loading } = useSubsystems();
  const [selectedNodeId, setSelectedNodeId] = useState<string | null>(null);
  const { nodeLinkId } = useParams();

  useEffect(() => {
    if (nodeLinkId) {
      const selectedNode = nodes.find(n => n.link_id === nodeLinkId);
      if (selectedNode) {
        setSelectedNodeId(selectedNode.id);
      }
    }
  }, [nodeLinkId, nodes]);

  const activeNode = nodes.find(n => n.id === selectedNodeId) || nodes[0];

  if (loading) return (
    <div className="loading-state font-mono p-10 opacity-50">
      SCANNING_LATTICE_REGISTRY...
    </div>
  );

  return (
    <div className="flex flex-col h-full">
      {/* Terminal - Fixed Height at Top */}
      <div className="border-b border-white/5">
        <SetDefinitionProvider setDefinition={TechDocs}>
          {activeNode ? (
            <SystemTerminal node={activeNode} />
          ) : (
            <div className="p-20 text-center opacity-20 font-mono text-xs">
              SELECT_NODE_FOR_TERMINAL_UPLINK
            </div>
          )}
        </SetDefinitionProvider>
      </div>

      {/* Registry - Takes Remaining Space, Has Internal Pagination */}
      <div className="flex-1 min-h-0 flex flex-col">
        <ProtocolRegistry
          onNodeSelect={(id: string) => setSelectedNodeId(id)}
          activeId={selectedNodeId}
        />
      </div>

      {/* Footer - Fixed at Bottom */}
      <footer className="p-4 flex justify-between items-center bg-black border-t border-white/5 text-[9px] font-mono text-white/30">
        <span>NODES_ONLINE: {nodes.length} | PROTOCOL: RDXT-V1</span>
        <div className="flex gap-4">
          <span>SECTOR: RAD-7</span>
          <span>STATUS: STABLE</span>
        </div>
      </footer>
    </div>
  );
};

export default SystemsIndex;