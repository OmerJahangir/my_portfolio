// Retires the service worker registered by the old Flutter version of this
// site. Browsers that cached that app fetch this file on their next visit,
// install it, and it then clears the old caches, removes itself and reloads
// open tabs so they get the current site. Safe to delete once old visitors
// have cycled through (a few months after the switch).
self.addEventListener('install', () => self.skipWaiting());

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    const keys = await caches.keys();
    await Promise.all(keys.map((key) => caches.delete(key)));
    await self.registration.unregister();
    const windows = await self.clients.matchAll({ type: 'window' });
    windows.forEach((client) => client.navigate(client.url));
  })());
});
