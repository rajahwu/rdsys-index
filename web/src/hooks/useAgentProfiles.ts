import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabaseClient';
import { AgentProfile } from '@/types/agent';

export function useAgentProfiles() {
  const [agents, setAgents] = useState<AgentProfile[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchAgents = async () => {
      try {
        setLoading(true);
        
        // Select all columns
        const { data, error } = await supabase
          .from('agent_profiles')
          .select('*')
          .order('agent_id', { ascending: true }); // V-00, then G-01, etc.

        if (error) throw error;

        // Transform if necessary, though our TS type matches the DB columns closely
        // Note: Supabase returns JSONB as objects, so strictly typing the response 
        // helps ensure 'specialization' is treated as string[]
        setAgents(data as unknown as AgentProfile[]); 
        
      } catch (err: any) {
        console.error('Error fetching agent profiles:', err);
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchAgents();

    // OPTIONAL: Realtime Subscription
    // If you want the dashboard to update instantly when you change a status in DB
    const subscription = supabase
      .channel('agent_profiles_changes')
      .on('postgres_changes', 
          { event: '*', schema: 'public', table: 'agent_profiles' }, 
          (payload) => {
            // Simple strategy: re-fetch or optimistically update
            console.log('Realtime update received:', payload);
            fetchAgents(); 
          }
      )
      .subscribe();

    return () => {
      subscription.unsubscribe();
    };

  }, []);

  return { agents, loading, error };
}