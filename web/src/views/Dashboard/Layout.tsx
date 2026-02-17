import React from 'react';
import { useHXTM } from '@/hooks/useHXTM';
import DashboardHeader from './Header';
import DashboardLeftWing from './LeftWing';
import DashboardCenter from './Center';
import DashboardRightWing from './RightWing';


export default function DashboardLayout() {
    const { energy, isActive, elapsed } = useHXTM();

    return (
        <div className={`min-h-screen bg-black text-white p-6 transition-all duration-700 ${energy === 'LOW' ? 'grayscale opacity-80' : ''}`}>

            {/* 📡 HEADER: SYSTEM STATUS & GLOBAL TIME */}
            <DashboardHeader />

            <main className="grid grid-cols-12 gap-6 items-start m-10 p-10">
                {/* 🧬 LEFT: THE BIOLOGICAL WING */}
               

                <DashboardLeftWing />
            
                {/* ⚔️ CENTER: THE OPERATIONAL CORE */}

                <DashboardCenter />


                {/* 🕸️ RIGHT: THE COLLABORATIVE LATTICE */}
                <DashboardRightWing />
            </main>
        </div>
    );
}
