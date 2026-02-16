interface P03SigilProps {
    size?: number;
    status?: 'ACTIVE' | 'IDLE' | 'STALE' | 'OFFLINE';
}

export const P03Sigil = ({ size = 64, status = 'ACTIVE' }: P03SigilProps) => {
    const glowColor = {
        ACTIVE: '#00FF88',
        IDLE: '#FFA500',
        STALE: '#FF6B35',
        OFFLINE: '#666666'
    }[status];

    return (
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" width={size} height={size}>
            <defs>
                <filter id={`glow-p03-${status}`}>
                    <feGaussianBlur stdDeviation="4" result="coloredBlur" />
                    <feMerge>
                        <feMergeNode in="coloredBlur" />
                        <feMergeNode in="SourceGraphic" />
                    </feMerge>
                </filter>
            </defs>
            {/* <!-- Central Lamp --> */}
            <circle cx="100" cy="100" r="20"
                fill="none" stroke="#F5F5DC" strokeWidth="5" />

            {/* <!-- Outer Lamps --> */}
            <circle cx="100" cy="30" r="8" fill="#FFD700" />
            <circle cx="170" cy="70" r="8" fill="#FFD700" />
            <circle cx="170" cy="130" r="8" fill="#FFD700" />
            <circle cx="100" cy="170" r="8" fill="#FFD700" />
            <circle cx="30" cy="130" r="8" fill="#FFD700" />
            <circle cx="30" cy="70" r="8" fill="#FFD700" />
        </svg>

    );
};
