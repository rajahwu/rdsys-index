import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabaseClient';

export interface Subsystem {
  id: string;
  link_id: string;
  name: string;
  mission_statement: string;
  status_state: string;
}

export function useSubsystems() {
  const [nodes, setNodes] = useState<Subsystem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchNodes = async () => {
      const { data, error } = await supabase
        .from('subsystems')
        .select('*')
        .order('link_id', { ascending: true });
      
      if (!error) setNodes(data || []);
      setLoading(false);
    };

    fetchNodes();
  }, []);

  return { nodes, loading };
}
