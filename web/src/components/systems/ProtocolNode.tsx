import { NavLink, useParams } from 'react-router-dom';

export default function ProtocolNode({ node }) {
    const { nodeLinkId } = useParams();
    const isActive = nodeLinkId === node.link_id;
    
    return (
        <div className={`group border border-white/5 p-3 transition-all ${
            isActive ? 'bg-rdxt-teal/5 border-rdxt-teal/30' : 'hover:border-white/10'
        }`}>
            {/* Top Row: ID and Status */}
            <div className="flex items-start justify-between mb-2">
                <span className="text-[9px] text-white/30 tracking-wider font-mono">
                    {node.link_id}
                </span>
                <span className={`text-[9px] px-2 py-0.5 border ${
                    node.status_state === 'initialized' 
                        ? 'border-rdxt-teal/30 text-rdxt-teal' 
                        : 'border-white/10 text-white/40'
                }`}>
                    {node.status_state.toUpperCase()}
                </span>
            </div>

            {/* Node Name */}
            <h3 className="text-sm font-bold text-white/80 mb-3 group-hover:text-rdxt-teal transition-colors">
                {node.name.toUpperCase()}
            </h3>

            {/* Tags */}
            <div className="flex flex-wrap gap-1.5 mb-3">
                {['BRAND-ASSETS', 'COLOR-SYSTEM', 'CORE-IDENTITY'].map((tag) => (
                    <span key={tag} className="text-[7px] px-1.5 py-0.5 border border-white/10 text-white/30">
                        {tag}
                    </span>
                ))}
            </div>

            {/* Action Button */}
            <NavLink 
                to={`/dashboard/${node.link_id}`}
                className={`block text-center text-[10px] font-bold py-2 border transition-all ${
                    isActive 
                        ? 'border-rdxt-teal bg-rdxt-teal/10 text-rdxt-teal' 
                        : 'border-white/10 text-white/50 hover:border-rdxt-teal/50 hover:text-rdxt-teal'
                }`}
            >
                {isActive ? '● ACTIVE_NODE' : 'ACCESS_NODE →'}
            </NavLink>
        </div>
    );
}