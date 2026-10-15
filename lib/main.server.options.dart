// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:my_portfolio/components/drawer_content.dart' as _drawer_content;
import 'package:my_portfolio/components/glass_card.dart' as _glass_card;
import 'package:my_portfolio/components/nav_bar.dart' as _nav_bar;
import 'package:my_portfolio/components/section_title.dart' as _section_title;
import 'package:my_portfolio/components/side_drawer.dart' as _side_drawer;
import 'package:my_portfolio/components/social_links.dart' as _social_links;
import 'package:my_portfolio/sections/about_section.dart' as _about_section;
import 'package:my_portfolio/sections/cards_section.dart' as _cards_section;
import 'package:my_portfolio/sections/intro_section.dart' as _intro_section;
import 'package:my_portfolio/sections/item_card.dart' as _item_card;
import 'package:my_portfolio/styles/theme.dart' as _theme;
import 'package:my_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _side_drawer.SideDrawer: ClientTarget<_side_drawer.SideDrawer>(
      'side_drawer',
    ),
  },
  styles: () => [
    ..._theme.styles,
    ..._app.App.styles,
    ..._drawer_content.DrawerContent.styles,
    ..._glass_card.GlassCard.styles,
    ..._nav_bar.NavBar.styles,
    ..._section_title.SectionTitle.styles,
    ..._side_drawer.SideDrawer.styles,
    ..._social_links.FollowMeRail.styles,
    ..._social_links.SocialIcons.styles,
    ..._about_section.AboutSection.styles,
    ..._cards_section.CardsSection.styles,
    ..._intro_section.IntroSection.styles,
    ..._item_card.ItemCard.styles,
  ],
);
