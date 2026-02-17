import { Routes, Route } from 'react-router-dom';
import { DashboardView } from '@/views/Dashboard';
import SystemDetailPage from '@/pages/systems/SystemPage';
import AgentDetailPage from '@/pages/agents/AgentDetailPage';
import TelemetryDetailPage from '@/pages/telemetry/TelemetryPage';
import '@/styles/radiant-systems.css';
import '@/styles/app.css';


function App() {
  return (
      <Routes>
        <Route path="/" element={<DashboardView />} />
        <Route path="/dashboard/:nodeLinkId" element={<DashboardView />} />
        <Route path="/agents/:agentId" element={<AgentDetailPage />} />
        <Route path="/telemetry" element={<TelemetryDetailPage />} />
        <Route path="/corelink/:nodeLinkId" element={<SystemDetailPage />} />
      </Routes>
  );
}

export default App;

// This file is not used directly. It is imported by src/main.tsx, which is the entry point of the application.