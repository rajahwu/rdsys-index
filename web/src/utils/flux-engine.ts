import { EnergyLevel } from '@/hooks/useHXTM';

// 1. Define the Tonal Strategies (The "How")
export type ToneStrategy = 
  | 'STABILIZING'       // Anchor here.
  | 'AMPLIFYING'        // Add zero.
  | 'VALIDATING'        // Scoped this.
  | 'WARM_REASSURING'   // Got the wall.
  | 'DIRECT';           // Non-negotiable.

// 2. The Validator Hooks (The "Linguistic Anchors")
export const VALIDATOR_HOOKS: Record<ToneStrategy, string> = {
  STABILIZING: "Anchor here.",
  AMPLIFYING: "Add zero.",
  VALIDATING: "Scoped this.",
  WARM_REASSURING: "I've got the wall.",
  DIRECT: "Non-negotiable."
};

// 3. The Flux Logic (Energy + Time = Strategy)
export const calculateFluxStrategy = (
  energy: EnergyLevel, 
  elapsedSeconds: number
): ToneStrategy => {
  
  // Rule 1: Low Energy requires Stabilization
  if (energy === 'LOW') {
    // If running long on low energy, switch to Reassurance
    return elapsedSeconds > 3600 ? 'WARM_REASSURING' : 'STABILIZING';
  }

  // Rule 2: High Energy demands Amplification
  if (energy === 'HIGH') {
    // If just starting, go Direct; if in flow, Amplify
    return elapsedSeconds < 600 ? 'DIRECT' : 'AMPLIFYING';
  }

  // Rule 3: Medium Energy is for Validation (Standard Ops)
  return 'VALIDATING';
};

// 4. The Recommendation Engine
export const getOperationalGuidance = (energy: EnergyLevel, elapsed: number) => {
  const strategy = calculateFluxStrategy(energy, elapsed);
  const hook = VALIDATOR_HOOKS[strategy];
  
  return {
    strategy,
    hook,
    uiColor: strategy === 'STABILIZING' ? 'text-blue-400' : 
             strategy === 'AMPLIFYING' ? 'text-rdxt-teal' : 'text-white/60'
  };
};
