import { useTheme } from '@clearline7/theme';
import { Heading } from '@clearline7/components';

interface SystemTerminalProps {
  node: {
    id: string;
    link_id?: string; // Matching Supabase link_id
    name?: string;    // Matching Supabase name
    assets?: string[]; // Kept for backward compatibility
    mission_statement?: string; // New live data
  };
}

export default function SystemTerminal({ node }: SystemTerminalProps) {
  const theme = useTheme();
  const borderColor = theme.colors?.primary || 'var(--rdxt-teal)';

  // Safety first: Ensure assets exists or provide an empty array
  const assetList = node.assets || []; 

  return (
    <div className="terminal-container mt-12 p-10 border-t-2 border-dashed border-white/10">
      <div className="terminal-header grid grid-cols-3 border-2" style={{ borderColor }}>
        <div className="col-span-3 p-2 text-center border-b-2 font-bold" style={{ borderColor }}>
          TERMINAL_DATA_STREAM // {(node.name || node.id).toUpperCase()}
        </div>
        <div className="p-3 border-r-2" style={{ borderColor }}>NODE_ID: {node.link_id || node.id}</div>
        <div className="p-3 border-r-2" style={{ borderColor }}>STATUS: REGISTERED</div>
        <div className="p-3">PROTOCOL: L7_RDXT</div>
      </div>

      <div className="terminal-body mt-6">
        <Heading level={3}>MISSION_DIRECTIVE</Heading>
        <p className="text-[10px] opacity-60 italic mb-4">
          {node.mission_statement || "No directive found for this node."}
        </p>

        <Heading level={3}>DIRECTORY_WALK</Heading>
        <div className="font-mono text-xs space-y-2 mt-4 opacity-80">
          {assetList.length > 0 ? (
            assetList.map((asset) => (
              <div key={asset} className="flex justify-between border-b border-white/5 py-1">
                <span>{asset.endsWith('.sql') ? '💾' : '📄'} {node.id}/{asset}</span>
                <span className="text-[10px]">[LOADED]</span>
              </div>
            ))
          ) : (
            <div className="opacity-30 italic text-[10px]">NO_ASSETS_INDEXED_FOR_NODE</div>
          )}
        </div>
      </div>
      
      {/* Footer... */}
    </div>
  );
}