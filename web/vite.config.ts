import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import path from 'path'

export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      // CRITICAL FIX: Points '@' to 'src' directory, not root
      '@': path.resolve(__dirname, './src'),
    },
  },
})