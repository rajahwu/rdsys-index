import React from 'react';
import { SetDefinitionProvider } from '@clearline7/theme';
import { TechDocs } from '@clearline7/set-definitions';
import SystemTerminal from '@/components/terminal/SystemTerminal';

interface HeaderTerminalProps {
    node: any;
}

export default function HeaderTerminal({ node }: HeaderTerminalProps) {
    return (
        <div className="border-b border-white/5">
            <SetDefinitionProvider setDefinition={TechDocs}>
                {node ? (
                    <SystemTerminal node={node} />
                ) : (
                    <div className="p-20 text-center opacity-20 font-mono text-xs">
                        SELECT_NODE_FOR_TERMINAL_UPLINK
                    </div>
                )}
            </SetDefinitionProvider>
        </div>
    );
}