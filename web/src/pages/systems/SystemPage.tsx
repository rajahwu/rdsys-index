import React, { useState, useEffect } from 'react';
import { useHXTM } from '@/hooks/useHXTM';
import { SystemHeader, SystemTerminalView } from '@/components/systems';
// import SystemTerminal from '@/components/terminal/SystemTerminal';
import ReactMarkdown from 'react-markdown';
import { useSubsystems } from '@/hooks/useSubsystems';
import { useParams } from 'react-router-dom';

interface SystemPageProps {
    nodeData: any;
}

export default function SystemPage() {
    const { energy } = useHXTM();
    const { nodeLinkId } = useParams();
    const { nodes, loading } = useSubsystems();
   
    
    const [nodeData, setNodeData] = useState<string | null>(nodes.find((node: any) => node.nodeLinkId === nodeLinkId)?.id || null);

    useEffect(() => {
        if (nodeLinkId) {
            const selectedNode = nodes.find(n => n.link_id === nodeLinkId);
            if (selectedNode) {
                setNodeData(selectedNode);
            }
        }
    }, [nodeLinkId, nodes]);

   
    if (loading) {
        return <div>Loading...</div>;
    }

    if (!nodeData) {
        return <div>Node not found</div>;
    }


    // Define what "Simplified Mode" looks like
    const isMinimal = energy === 'LOW';

    return (
        <div className={`system-layout ${isMinimal ? 'max-w-2xl mx-auto' : ''}`}>
            <SystemHeader node={nodeData} />

            {/* 1. Terminal: Only show at High/Med Energy */}
            {!isMinimal && (
                <div className="terminal-section animate-fade-in">
                    <SystemTerminalView node={nodeData} />
                </div>
            )}

            {/* 2. Main Content: Changes density based on energy */}
            <div className={`content-body ${isMinimal ? 'text-lg leading-relaxed' : 'text-sm'}`}>
                <ReactMarkdown>
                    {isMinimal ? nodeData.mission_statement : nodeData.full_markdown}
                </ReactMarkdown>
            </div>

            {/* 3. Action Bar: Always visible, but larger/simpler in Low Energy */}
            <div className={`action-footer mt-12 ${isMinimal ? 'p-10 border-2' : ''}`}>
                <button className="cta-primary">
                    {isMinimal ? 'EXECUTE_CORE_TASK' : 'RUN_SYSTEM_STACK_V2'}
                </button>
            </div>
        </div>
    );
}
