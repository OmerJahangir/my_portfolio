import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/glass_card.dart';
import '../data/my_strings.dart';
import '../styles/theme.dart';

/// "About" card with the long-form bio.
class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'about', [
      GlassCard(classes: 'about-card', [
        h2(classes: 'about-title', [.text('About')]),
        p(classes: 'about-text', [.text(MyStringConst.aboutMeFullText.trim())]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.about').styles(
      padding: .only(left: 7.vw, right: 7.vw, top: 5.vh, bottom: (defaultPadding * 2).px),
    ),
    css('.about-card').styles(padding: .all(defaultPadding.px)),
    css('.about-title').styles(
      margin: .only(bottom: defaultPadding.px),
      fontSize: 50.px,
      fontWeight: .w800,
    ),
    css(
      '.about-text',
    ).styles(margin: .zero, fontSize: 15.px, fontWeight: .w700, lineHeight: 1.6.em, whiteSpace: .preLine),
    css.media(maxWidth(desktopMin - 1), [
      css('.about-title').styles(fontSize: 40.px),
      css('.about-text').styles(fontSize: 14.px),
    ]),
    css.media(maxWidth(largeMobileMax), [
      css('.about-title').styles(fontSize: 35.px),
      css('.about-text').styles(fontSize: 12.px),
    ]),
  ];
}
