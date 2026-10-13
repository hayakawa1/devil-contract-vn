import { resolve } from 'node:path';
import { defineConfig } from 'vite';

export default defineConfig({
  base: './',
  server: {
    watch: {
      ignored: [
        '**/release/**',
        '**/dist/**',
        '**/dist-tauri/**',
        '**/dist-tauri-embed/**',
        '**/src-tauri/**',
      ],
    },
  },
  build: {
    rollupOptions: {
      input: {
        index: resolve(__dirname, 'index.html'),
        flyer: resolve(__dirname, 'flyer.html'),
      },
    },
  },
});
