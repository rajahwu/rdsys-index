import React from 'react';
import '@/styles/radiant-systems.css';
import '@/styles/app.css';

export const DashboardSettings = () => {
    return (
        <div className="dashboard-settings">
            <h2>Dashboard Settings</h2>
            <p>Configure your dashboard preferences here.</p>
        </div>
    );
};

export const Settings = () => {
    return (
        <div className="settings">
            <DashboardSettings />
        </div>
    );
};

export default Settings;

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.