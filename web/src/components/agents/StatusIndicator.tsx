export function StatusIndicator({ status }: { status: string }) {
  const colorMap: Record<string, string> = {
    'ACTIVE': '#22c55e', // Green
    'IDLE': '#eab308',   // Yellow
    'STALE': '#f97316',  // Orange
    'OFFLINE': '#6b7280' // Gray
  };
  
  return (
    <div className="w-3 h-3 rounded-full" style={{ backgroundColor: colorMap[status] || '#6b7280' }} />
  );
}