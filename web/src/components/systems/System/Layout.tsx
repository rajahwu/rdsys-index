export default function SystemLayout({ children }: { children: React.ReactNode }) {
    return (
        <div className="flex flex-col h-full">
            <div className="flex-1 overflow-hidden">{children}</div>
        </div>
    );
}

// This layout is used for the main system view, providing a full-height container for the header, grid, and terminal sections.