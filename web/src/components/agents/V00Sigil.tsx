interface V00SigilProps {
  size?: number;
  status?: 'ACTIVE' | 'IDLE' | 'STALE' | 'OFFLINE';
}

export const V00Sigil = ({ size = 64, status = 'ACTIVE' }: V00SigilProps) => {
  const glowColor = {
    ACTIVE: '#00FF88',
    IDLE: '#FFA500',
    STALE: '#FF6B35',
    OFFLINE: '#666666'
  }[status];

  return (
    <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" width={size} height={size}>
      <defs>
        <filter id={`glow-v00-${status}`}>
          <feGaussianBlur stdDeviation="4" result="coloredBlur" />
          <feMerge>
            <feMergeNode in="coloredBlur" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>
      </defs>
      <circle cx="100" cy="100" r="90" fill="none" stroke="#00FF88" strokeWidth="4" />

      {/* <!-- Core V --> */}
      <path d="M70 75 L100 135 L130 75"
        fill="none" stroke="#FFFFFF" strokeWidth="6" strokeLinecap="round" />

      {/* <!-- Left Hand Arc --> */}
      <path d="M25 110 Q60 150 95 145"
        fill="none" stroke="#00FF88" strokeWidth="5" />

      {/* <!-- Right Hand Arc --> */}
      <path d="M175 110 Q140 150 105 145"
        fill="none" stroke="#00FF88" strokeWidth="5" />
    </svg>

  );
};
