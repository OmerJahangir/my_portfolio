# Omer Jahangir — Portfolio

Personal portfolio site for Muhammad Omer Jahangir, Senior Flutter Engineer: published apps, open-source projects, Flutter packages and a profile drawer with skills and contact details.

Built with [Jaspr](https://jaspr.site), a Dart web framework. The site is **statically pre-rendered** to plain HTML/CSS at build time. Only the profile drawer is hydrated with JavaScript (`@client`), so pages load instantly and are readable by search engines.

## Project layout

```
lib/
  main.server.dart   build-time entrypoint: <head> metadata + renders App
  main.client.dart   browser entrypoint for @client components
  app.dart           page shell: nav bar, sections, footer
  data/              content (projects, packages, bio text, links), edit these to update the site
  styles/theme.dart  colours, breakpoints and global CSS
  components/        nav bar, side drawer, glass card, social links, section title
  sections/          intro, projects/packages grid, about
web/                 static files copied as-is (assets/, icons/, favicon, manifest)
test/                jaspr_test component tests
```

To add a project or package, append an entry to `lib/data/project_model.dart` or `lib/data/packages_model.dart`.

## Develop

```bash
dart pub global activate jaspr_cli   # once
jaspr serve                          # dev server with hot reload at http://localhost:8080
dart test                            # run tests
dart analyze
```

## Build and deploy

```bash
jaspr build
```

Outputs a static site to `build/jaspr/`. Upload that folder to any static host (GitHub Pages, Firebase Hosting, Netlify, Vercel). If the site is served from a sub-path (e.g. `username.github.io/my_portfolio/`), set `base: '/my_portfolio/'` on the `Document` in `lib/main.server.dart`.

The previous Flutter version of this app lives on the `main` and `upgrade/flutter-3.47` branches.
