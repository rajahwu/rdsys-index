# **2\. Color System**

All colors used in Style-System with complete specifications.

| Token Name | Hex | RGB | CMYK | Pantone | Usage |
| ----- | ----- | ----- | ----- | ----- | ----- |
| brand.primary | \#3B82F6 | 59, 130, 246 | 76, 47, 0, 0 | 2727 C | Primary actions, highlights, key icons, brand identity |
| brand.primary.light | \#60A5FA | 96, 165, 250 | 62, 34, 0, 0 | 2728 C | Hover states, secondary accents, lighter emphasis |
| neutral.900 | \#111827 | 17, 24, 39 | 85, 70, 55, 65 | Black 6 C | Headings, high-contrast text, primary emphasis |
| neutral.800 | \#1F2937 | 31, 41, 55 | 75, 60, 45, 50 | 533 C | Body text, primary content, readable dark |
| neutral.700 | \#374151 | 55, 65, 81 | 65, 50, 40, 30 | 532 C | Secondary headings, medium emphasis |
| neutral.600 | \#4B5563 | 75, 85, 99 | 55, 45, 35, 20 | Cool Gray 11 C | Tertiary text, subtle headings |
| neutral.500 | \#6B7280 | 107, 114, 128 | 45, 35, 28, 5 | Cool Gray 8 C | Secondary text, icon defaults, muted content |
| neutral.400 | \#9CA3AF | 156, 163, 175 | 30, 20, 15, 0 | Cool Gray 5 C | Placeholder text, disabled states |
| neutral.300 | \#D1D5DB | 209, 213, 219 | 15, 10, 8, 0 | Cool Gray 4 C | Borders, dividers, inactive elements |
| neutral.200 | \#E5E7EB | 229, 231, 235 | 8, 5, 4, 0 | Cool Gray 2 C | Light borders, subtle separators |
| neutral.100 | \#F3F4F6 | 243, 244, 246 | 4, 3, 2, 0 | Cool Gray 1 C | Subtle backgrounds, hover states |
| neutral.50 | \#F9FAFB | 249, 250, 251 | 2, 1, 1, 0 | White | Light backgrounds, card surfaces, page base |
| accent.success | \#10B981 | 16, 185, 129 | 70, 0, 55, 0 | 3405 C | Success states, confirmations, positive feedback |
| accent.warning | \#F59E0B | 245, 158, 11 | 0, 35, 95, 0 | 130 C | Warnings, cautions, attention needed |
| accent.error | \#EF4444 | 239, 68, 68 | 0, 72, 72, 0 | 1788 C | Errors, critical alerts, destructive actions |

Color Notes:  
Style System uses a sophisticated blue (brand.primary) as its identity — trustworthy, professional, widely accessible. The complete neutral scale (50-900) provides a comprehensive hierarchy for any UI need. Accent colors follow standard semantic meanings: green for success, amber for warnings, red for errors. This palette is designed for maximum flexibility and scalability.

Color Pairing Rules:

* Primary UI: brand.primary on neutral.50 or neutral.900  
* Text hierarchy: neutral.900 (headings) \> neutral.800 (body) \> neutral.500 (secondary)  
* Interactive states: Default neutral.500, hover brand.primary.light, active brand.primary  
* Feedback: Use semantic accents (success/warning/error) sparingly, only when needed