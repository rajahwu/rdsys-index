import React from 'react';
import { useNavigate } from 'react-router-dom';

interface SystemCardProps {
  node: {
    id: string;
    system: string;
    assets: string[];
  };
}

const SystemCard: React.FC<SystemCardProps> = ({ node }) => {
  const navigate = useNavigate();

  return (
    <div
      className="system-card"
      onClick={() => navigate(`/system/${node.id}`)}
      style={{ cursor: 'pointer' }}
    >
      <div className="system-card__header">
        <span className="font-mono text-[10px] opacity-40">{node.id}</span>
        <h2 className="system-card__name font-bold uppercase">{node.system}</h2>
      </div>

      <div className="system-card__meta mt-4">
        <div className="flex flex-wrap gap-1">
          {node.assets.map(asset => (
            <span key={asset} className="text-[9px] border border-white/10 px-1 font-mono uppercase">
              {asset.split('.')[0]}
            </span>
          ))}
        </div>
      </div>

      <div className="mt-6 text-right">
        <span className="text-rdxt-teal text-xs font-mono">ACCESS_NODE ➔</span>
      </div>
    </div>
  );
};

export default SystemCard;