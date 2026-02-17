export default function SystemsGrid({ nodes = [] }: { nodes: any[] }) {
    return (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 p-4">
            {nodes.map((node) => (
                <div key={node.link_id} className="border border-white/5 rounded-lg p-4">
                    <h3 className="text-lg font-bold text-white/80 mb-2">{node.name}</h3>
                    <p className="text-sm text-white/40 mb-4">{node.description}</p>
                    <a href="#" className="text-sm font-bold text-rdxt-teal hover:text-rdxt-teal/80 transition-colors">
                        View Details →
                    </a>
                </div>
            ))}
        </div>
    );
}