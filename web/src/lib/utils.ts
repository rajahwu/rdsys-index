import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

/**
 * Merges Tailwind classes and resolves conflicts.
 * Resolves Critical Issue [1] from audit.
 */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
