export interface CoreLink {
    link_id: string;
    name: string;
    description: string;
    mission_statement: string;
    full_markdown: string;
    status_state: string; // ACTIVE, IDLE, STALE, OFFLINE
}