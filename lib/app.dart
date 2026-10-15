import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/nav_bar.dart';
import 'sections/about_section.dart';
import 'sections/cards_section.dart';
import 'sections/intro_section.dart';
import 'styles/theme.dart';

/// The single-page portfolio: header, the four sections and a footer.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return .fragment([
      const NavBar(),
      main_([
        const IntroSection(),
        projectsSection(),
        packagesSection(),
        const AboutSection(),
      ]),
      footer(classes: 'site-footer', [
        .text('© ${DateTime.now().year} Muhammad Omer Jahangir · Built with Dart & Jaspr'),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-footer').styles(
      padding: .all(defaultPadding.px),
      color: bodyTextColor,
      textAlign: .center,
      fontSize: 12.px,
    ),
  ];
}
