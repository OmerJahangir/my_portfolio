/// The entrypoint for the **server** environment.
///
/// Runs at build time (`jaspr build`) to pre-render the site to static HTML.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

/// Public address of the site (GitHub Pages). Link previews need absolute URLs.
const _siteUrl = 'https://omerjahangir.github.io/';
const _title = 'Omer Jahangir | Flutter Developer';
const _description =
    'Omer Jahangir — Senior Flutter Engineer. Apps on the App Store and Google Play, '
    'open-source projects and Flutter packages.';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: _title,
      lang: 'en',
      meta: {
        'description': _description,
        'theme-color': '#000515',
        'twitter:card': 'summary',
      },
      head: [
        link(rel: 'icon', type: 'image/png', href: 'favicon.png'),
        link(rel: 'apple-touch-icon', href: 'icons/apple-touch-icon.png'),
        link(rel: 'manifest', href: 'manifest.json'),
        link(rel: 'canonical', href: _siteUrl),
        // Open Graph tags must use `property`, which the `meta` map above can't emit.
        for (final (property, content) in [
          ('og:type', 'website'),
          ('og:url', _siteUrl),
          ('og:title', _title),
          ('og:description', _description),
          ('og:image', '${_siteUrl}assets/images/image.png'),
        ])
          meta(attributes: {'property': property, 'content': content}),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
      ],
      body: App(),
    ),
  );
}
