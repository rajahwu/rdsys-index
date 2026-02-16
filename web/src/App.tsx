import { Routes, Route } from 'react-router-dom';
import DashboardView from '@/views/Dashboard/Layout';
import SettingsView from '@/views/SettingsView';
import '@/styles/radiant-systems.css';
import '@/styles/app.css';

export default function App() {
  return (
    <Routes>
      <Route path="/">
        <Route path="/dashboard" element={<DashboardView />} />
        <Route path="/dashboard/:nodeLinkId" element={<DashboardView />} />
      </Route>
      <Route path="/settings" element={<SettingsView />} />
    </Routes>
  );
}

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.