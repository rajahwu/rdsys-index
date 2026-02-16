import React from 'react';
import SystemsIndex from '@/components/systems/SystemsIndex';

export default function DashboardCenter() {
    return (
        <section className="col-span-6 min-w-0">
            <SystemsIndex />
        </section>
    );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.