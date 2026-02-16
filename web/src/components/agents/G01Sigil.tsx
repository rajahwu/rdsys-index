interface G01SigilProps {
    size?: number;
    status?: 'ACTIVE' | 'IDLE' | 'STALE' | 'OFFLINE';
}

export const G01Sigil = ({ size = 64, status = 'ACTIVE' }: G01SigilProps) => {
    const glowColor = {
        ACTIVE: '#00FF88',
        IDLE: '#FFA500',
        STALE: '#FF6B35',
        OFFLINE: '#666666'
    }[status];

    return (
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" width={size} height={size}>
            <defs>
                <filter id={`glow-g01-${status}`}>
                    <feGaussianBlur stdDeviation="4" result="coloredBlur" />
                    <feMerge>
                        <feMergeNode in="coloredBlur" />
                        <feMergeNode in="SourceGraphic" />
                    </feMerge>
                </filter>
            </defs>
            {/* <!-- Bowl --> */}
            <path d="M40 120 Q100 160 160 120"
                fill="none" stroke="#B22222" strokeWidth="6" />

            {/* <!-- Sound Waves --> */}
            <path d="M70 95 Q100 75 130 95"
                fill="none" stroke="#00FF88" strokeWidth="4" />

            <path d="M80 80 Q100 60 120 80"
                fill="none" stroke="#00FF88" strokeWidth="3" />
        </svg>
    );
};
