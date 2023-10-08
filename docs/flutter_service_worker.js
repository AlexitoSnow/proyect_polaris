'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b01aa394057c9c08f58b62fc7df8cbae",
"assets/AssetManifest.json": "85cd574998ca02f0056b26fabfe4b419",
"assets/assets/docs/activities_per_planet.json": "d0cb5b66e3a4e305becd0b88f43c361d",
"assets/assets/docs/planets_details.json": "c8d24c6008e44c0758cb3931309a0232",
"assets/assets/images/clothing.jpg": "af266f224f0214f1872ebe6bfd76358e",
"assets/assets/images/logo.png": "a758db842f0b9d2d11106ddde4aced6f",
"assets/assets/images/onlyplanets/earth.png": "d0fd887aaa80bf26f50c4865d2510d29",
"assets/assets/images/onlyplanets/jupiter.png": "eac39b416e38c50b9a74be936218c7e9",
"assets/assets/images/onlyplanets/mars.png": "d1fcde3618493de446a0f4fae7d73fa8",
"assets/assets/images/onlyplanets/mercury.png": "b8fb87bded044fbeb9f76073022f8e76",
"assets/assets/images/onlyplanets/moon.png": "ccc5f3800aba8209c7ac64dbdb3c2b02",
"assets/assets/images/onlyplanets/neptune.png": "6daa18af9d5ad8424ffaa1801cf28efc",
"assets/assets/images/onlyplanets/newurano.png": "1048ded64d599e4aca8550b6af4be5ca",
"assets/assets/images/onlyplanets/satelite.png": "0ae85ca6d5ec81f2faa831853e313921",
"assets/assets/images/onlyplanets/satelitenasa.png": "a4933ee88c79cf0a6953d102f929758f",
"assets/assets/images/onlyplanets/saturn.png": "178ae50166d661a38a665585bac2317c",
"assets/assets/images/onlyplanets/uranus.png": "4f456457588b7cc8671785546d15abca",
"assets/assets/images/onlyplanets/venus.png": "8ef19b39bb6d0b7ae2100e0ab47e714c",
"assets/assets/images/planets/earth/deathvalley.jpg": "eb5125af9083bbff87124b64bac4eb20",
"assets/assets/images/planets/earth/earth.jpg": "588da3845c751d54e662b822413cf47a",
"assets/assets/images/planets/earth/heilongjiang.jpg": "4d72402ea002e0e54ee242b191efe7a7",
"assets/assets/images/planets/earth/potosi.jpg": "6532ea815692c18681422acd21d5a73d",
"assets/assets/images/planets/emptyback.png": "f50b7bcf24001a77a90ba173b498d407",
"assets/assets/images/planets/jupiter/cyclones.jpg": "2caa507922b64f5111794b71379a46ff",
"assets/assets/images/planets/jupiter/jupiter.jpg": "f194f13c162096d659916bd06f386400",
"assets/assets/images/planets/jupiter/storms.jpg": "bd85efb23830a26ae280de2e6baf145a",
"assets/assets/images/planets/jupiter/swirls.jpg": "05e03f6fa937ef44d4134e6ee406f6b2",
"assets/assets/images/planets/mars/markerbandvalley.jpg": "db31872973ef7129790ea360389500f1",
"assets/assets/images/planets/mars/mars.jpg": "2a120969b8d88016c961def38725844e",
"assets/assets/images/planets/mars/olympusmons.jpg": "8bb709c9e08e26b2371ac6cefe2f7b1f",
"assets/assets/images/planets/mars/vallesmarineris.jpg": "3c5fb816c2e5d9a79377f666c1b48543",
"assets/assets/images/planets/mercury/abedincrater.jpg": "2e4ccb72d7025b6e3a02a7268594e334",
"assets/assets/images/planets/mercury/apollodorus.jpg": "dc62c33657b0bc2266bf46d86af75307",
"assets/assets/images/planets/mercury/mercury.jpg": "75b1bf63d16a7b61a2d16580d3112811",
"assets/assets/images/planets/mercury/northpolar.jpg": "23c222d794bc075425631619fb050e6e",
"assets/assets/images/planets/neptune/clouds.jpg": "37bef05e5d0cfd3fa175803086671e59",
"assets/assets/images/planets/neptune/neptune.jpg": "f2cf20def8b64ecc768e81f18c7f9bab",
"assets/assets/images/planets/saturn/alphaandomega.jpg": "eaa55708056fcde3194eaf08150a9675",
"assets/assets/images/planets/saturn/saturn.jpg": "951a0f76ee962ab5f626e86f60e329d7",
"assets/assets/images/planets/uranus/atmosphere.jpg": "079119e52bb41af8095e498805b23d0f",
"assets/assets/images/planets/uranus/uranus.jpeg": "27c1a0f3a9753382f6721fface98697e",
"assets/assets/images/planets/venus/crater.jpg": "de32898f7197b3d16abb6dfd32251cb4",
"assets/assets/images/planets/venus/nova.jpg": "f040829f183ecda0efa9c5023398e5fc",
"assets/assets/images/planets/venus/ridgebelt.jpg": "4c5f89aa7b8d9d996e8326e5036ef76e",
"assets/assets/images/planets/venus/venus.jpg": "c5ec628343504e1094c927e20f417818",
"assets/assets/images/rounded_logo.png": "897542476483e35a7783248211883e8d",
"assets/assets/images/speaker.jpeg": "951386edb7e3eb70994409248ff013b5",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "cb1fb20359c087e2c6f28425b01fecc8",
"assets/NOTICES": "b2c0524ed2356e23b4dd3310c78fc32b",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "a758db842f0b9d2d11106ddde4aced6f",
"icons/Icon-512.png": "a758db842f0b9d2d11106ddde4aced6f",
"icons/Icon-maskable-192.png": "a758db842f0b9d2d11106ddde4aced6f",
"icons/Icon-maskable-512.png": "a758db842f0b9d2d11106ddde4aced6f",
"index.html": "c1c55169a7dce6f5ed1d66a71c37b0f6",
"/": "c1c55169a7dce6f5ed1d66a71c37b0f6",
"logo.png": "a758db842f0b9d2d11106ddde4aced6f",
"main.dart.js": "cc7a3f48afcb6ba702fc05480b9ca5e7",
"manifest.json": "444ccb4bacd1e81a8a5f99fd1997f6bd",
"splash/img/dark-1x.png": "502b66e1c04ac5789a242647897580ab",
"splash/img/dark-2x.png": "3648c4ffac1c5a09a7479d2d325fe372",
"splash/img/dark-3x.png": "538a848f789ea0a2bc7871055e36f85f",
"splash/img/dark-4x.png": "9eae5021dcf99b490da7351da9c9aaa7",
"splash/img/light-1x.png": "502b66e1c04ac5789a242647897580ab",
"splash/img/light-2x.png": "3648c4ffac1c5a09a7479d2d325fe372",
"splash/img/light-3x.png": "538a848f789ea0a2bc7871055e36f85f",
"splash/img/light-4x.png": "9eae5021dcf99b490da7351da9c9aaa7",
"version.json": "41106c624d9fea63436b34752a0f7e3a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
