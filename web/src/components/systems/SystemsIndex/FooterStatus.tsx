import React from 'react';

interface FooterStatusProps {
    nodes: any[];
}

export default function FooterStatus({ nodes }: FooterStatusProps) {
    return (
        <footer className="p-4 flex justify-between items-center bg-black border-t border-white/5 text-[9px] font-mono text-white/30">
            <span>NODES_ONLINE: {nodes.length} | PROTOCOL: RDXT-V1</span>
            <div className="flex gap-4">
                <span>SECTOR: RAD-7</span>
                <span>STATUS: STABLE</span>
            </div>
        </footer>
    );
}