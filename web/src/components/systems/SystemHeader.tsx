import React from 'react';

const SystemHeader = ({ node }: any) => {
  return (
    <header className="system-header p-6 bg-zinc-900 border-b border-white/10">
      <h1 className="text-2xl font-bold">{node.system}</h1>
      <p className="text-sm text-zinc-400">{node.id}</p>
    </header>
  );
};

export default SystemHeader;
