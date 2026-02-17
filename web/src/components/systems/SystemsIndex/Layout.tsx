import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useSubsystems } from '@/hooks/useSubsystems';
import HeaderTerminal from './HeaderTerminal';
import CenterRegistry from './CenterRegistry';
import FooterStatus from './FooterStatus';

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

    if (loading) {
        return (
            <div className="loading-state font-mono p-10 opacity-50">
                SCANNING_LATTICE_REGISTRY...
            </div>
        );
    }

    return (
        <div className="flex flex-col h-full">
            {/* Terminal - Fixed Height at Top */}
            <HeaderTerminal node={activeNode} />

            {/* Registry - Takes Remaining Space, Has Internal Pagination */}
            <CenterRegistry
                onNodeSelect={(id: string) => setSelectedNodeId(id)}
                activeId={selectedNodeId}
            />

            {/* Footer - Fixed at Bottom */}
            <FooterStatus nodes={nodes} />
        </div>
    );
};

export default SystemsIndex;