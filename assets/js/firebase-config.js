// Centralized Firebase initialization for the site
// Usage: import { app, db, analytics } from './firebase-config.js'

import { initializeApp } from "https://www.gstatic.com/firebasejs/12.4.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/12.4.0/firebase-analytics.js";
import { initializeFirestore } from "https://www.gstatic.com/firebasejs/12.4.0/firebase-firestore.js";

// Firebase configuration for evoka2025 project
export const firebaseConfig = {
  apiKey: "AIzaSyCIBWciun9QEJrSapnnaLY7BCtP5s8OWf4",
  authDomain: "evoka2025-19e65.firebaseapp.com",
  projectId: "evoka2025-19e65",
  storageBucket: "evoka2025-19e65.firebasestorage.app",
  messagingSenderId: "186334777555",
  appId: "1:186334777555:web:cccad1aacfc44e0fbbc426",
  measurementId: "G-6QJH19JK7Z"
};

export const app = initializeApp(firebaseConfig);
export const analytics = (() => { try { return getAnalytics(app); } catch (_) { return null; } })();

// Use long-polling auto-detection to avoid 400 RPC issues behind proxies/ad blockers
export const db = initializeFirestore(app, { experimentalAutoDetectLongPolling: true });
