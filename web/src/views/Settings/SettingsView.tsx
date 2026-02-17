import { DashboardSettings } from "@/components/settings/DashboardSettings";
import '@/styles/radiant-systems.css';
import '@/styles/app.css';  

export default function SettingsView() {
  return (
    <div className="settings-view">
      <DashboardSettings />
    </div>
  );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.