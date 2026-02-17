import React from 'react';
import { ProtocolRegistry } from '@/components/systems';

interface CenterRegistryProps {
    onNodeSelect: (id: string) => void;
    activeId: string | null;
}

export default function CenterRegistry({ onNodeSelect, activeId }: CenterRegistryProps) {
    return (
        <div className="flex-1 min-h-0 flex flex-col">
            <ProtocolRegistry
                onNodeSelect={onNodeSelect}
                activeId={activeId}
            />
        </div>
    );
}