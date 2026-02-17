import React, { useState, useMemo } from 'react';
import { useSubsystems } from '@/hooks/useSubsystems';
import ProtocolNode from './ProtocolNode';

interface ProtocolRegistryProps {
  onNodeSelect: (id: string) => void;
  activeId?: string | null;
}

const NODES_PER_PAGE = 5; // Adjust based on available space

const ProtocolRegistry: React.FC<ProtocolRegistryProps> = ({ onNodeSelect, activeId }) => {
  const { nodes, loading } = useSubsystems();
  const [currentPage, setCurrentPage] = useState(1);

  // Calculate pagination
  const totalPages = Math.ceil(nodes.length / NODES_PER_PAGE);
  const startIndex = (currentPage - 1) * NODES_PER_PAGE;
  const endIndex = startIndex + NODES_PER_PAGE;
  const currentNodes = useMemo(() => nodes.slice(startIndex, endIndex), [nodes, startIndex, endIndex]);

  const goToPage = (page: number) => {
    if (page >= 1 && page <= totalPages) {
      setCurrentPage(page);
    }
  };

  if (loading) return (
    <div className="p-10 animate-pulse font-mono opacity-20">
      INDEXING_NODES...
    </div>
  );

  return (
    <div className="flex flex-col h-full">
      {/* Header - Fixed */}
      <div className="px-6 pt-6 pb-4 border-b border-white/5">
        <h2 className="text-sm font-bold tracking-widest text-white/90">
          RADIANT_SEVEN_REGISTRY
        </h2>
        <p className="text-[10px] text-white/40">
          L7_PROTOCOL_NODES_INDEXED
        </p>
      </div>

      {/* Node List - Fixed Height Grid (No Scroll, No Jumping) */}
      <div className="flex-1 px-6 py-4">
        <div className="grid gap-3 h-full content-start">
          {currentNodes.map((node) => (
            <ProtocolNode node={node} key={node.id} />
          ))}
        </div>
      </div>

      {/* Pagination - Fixed at Bottom of Registry */}
      <div className="px-6 py-4 border-t border-white/5 flex items-center justify-between font-mono text-[10px]">
        <div className="text-white/40">
          PAGE {currentPage} OF {totalPages} 
          <span className="ml-3 text-white/20">
            ({startIndex + 1}-{Math.min(endIndex, nodes.length)} OF {nodes.length})
          </span>
        </div>
        
        <div className="flex items-center gap-2">
          <button
            onClick={() => goToPage(currentPage - 1)}
            disabled={currentPage === 1}
            className="px-3 py-1 border border-white/10 disabled:opacity-20 disabled:cursor-not-allowed hover:bg-white/5 transition-colors"
          >
            ← PREV
          </button>
          
          {/* Page Indicator */}
          <div className="flex items-center gap-1 text-white/60">
            {Array.from({ length: Math.min(totalPages, 5) }, (_, i) => {
              let pageNum;
              if (totalPages <= 5) {
                pageNum = i + 1;
              } else if (currentPage <= 3) {
                pageNum = i + 1;
              } else if (currentPage >= totalPages - 2) {
                pageNum = totalPages - 4 + i;
              } else {
                pageNum = currentPage - 2 + i;
              }
              
              return (
                <button
                  key={pageNum}
                  onClick={() => goToPage(pageNum)}
                  className={`w-7 h-7 border transition-colors ${
                    pageNum === currentPage 
                      ? 'border-rdxt-teal bg-rdxt-teal/10 text-rdxt-teal' 
                      : 'border-white/10 hover:bg-white/5'
                  }`}
                >
                  {pageNum}
                </button>
              );
            })}
          </div>

          <button
            onClick={() => goToPage(currentPage + 1)}
            disabled={currentPage === totalPages}
            className="px-3 py-1 border border-white/10 disabled:opacity-20 disabled:cursor-not-allowed hover:bg-white/5 transition-colors"
          >
            NEXT →
          </button>
        </div>
      </div>
    </div>
  );
};

export default ProtocolRegistry;
