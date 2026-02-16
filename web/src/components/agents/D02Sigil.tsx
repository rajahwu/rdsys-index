interface D02SigilProps {
    size?: number;
    status?: 'ACTIVE' | 'IDLE' | 'STALE' | 'OFFLINE';
}

export const D02Sigil = ({ size = 64, status = 'ACTIVE' }: D02SigilProps) => {
    const glowColor = {
        ACTIVE: '#00FF88',
        IDLE: '#FFA500',
        STALE: '#FF6B35',
        OFFLINE: '#666666'
    }[status];

    return (
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" width={size} height={size}>
             <defs>
                <filter id={`glow-d02-${status}`}>
                    <feGaussianBlur stdDeviation="4" result="coloredBlur"/>
                    <feMerge>
                        <feMergeNode in="coloredBlur"/>
                        <feMergeNode in="SourceGraphic"/>
                    </feMerge>
                </filter>
            </defs>
            {/* <!-- Frame --> */}
            <rect x="50" y="40" width="100" height="120"
                fill="none" stroke="#222222" strokeWidth="6" />

            {/* <!-- Open Door Line --> */}
            <line x1="120" y1="40" x2="120" y2="160"
                stroke="#FFD700" strokeWidth="4" />

            {/* <!-- Ground Line --> */}
            <line x1="50" y1="160" x2="150" y2="160"
                stroke="#444444" strokeWidth="3" />
        </svg>

    );
};
