import React from 'react';
import { Link } from 'react-router-dom';

const SystemHeader = ({ node }: any) => {
  console.log(node);
  return (
    <div className="system-header-container">
      <nav className="mb-4">
        <Link to="/" className="text-sm text-cyan-500 hover:text-cyan-400 transition-colors">
          ← Back to Dashboard  / <span>{node.system}</span>
        </Link>
      </nav>
      <header className="system-header p-6 bg-zinc-900 border-b border-white/10">
        <h1 className="text-2xl font-bold">{node.name}</h1>
        <p className="text-sm text-zinc-400">{node.link_id}</p>
        <a href={node.coordinates.git_remote} target="_blank" rel="noopener noreferrer" className="text-sm text-blue-500 hover:underline">
          View on GitHub
        </a>
      </header>
    </div>
  );
};

export default SystemHeader;
