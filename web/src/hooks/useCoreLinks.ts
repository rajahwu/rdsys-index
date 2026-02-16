// hooks/useCoreLinks.ts
import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabaseClient';
import { CoreLink } from '@/types/corelink'; // Ensure this type exists

export function useCoreLinks() {
    const [systems, setSystems] = useState<CoreLink[]>([]);

    useEffect(() => {
        const fetchSystems = async () => {
            const { data } = await supabase
                .from('core_links')
                .select('*')
                .order('link_id');

            if (data) setSystems(data);
        };

        fetchSystems();
    }, []);

    return { systems };
}