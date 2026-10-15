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
        div(classes: 'about-text', _bioBlocks(MyStringConst.aboutMeFullText)),
      ]),
    ]);
  }

  /// Splits the plain-text bio into headings (lines starting with an emoji),
  /// bullet lists (lines starting with •) and paragraphs.
  static List<Component> _bioBlocks(String bio) {
    final blocks = <Component>[];
    var bullets = <Component>[];

    void flushBullets() {
      if (bullets.isEmpty) return;
      blocks.add(ul(bullets));
      bullets = [];
    }

    for (final line in bio.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty)) {
      if (line.startsWith('•')) {
        bullets.add(li([_bullet(line.substring(1).trim())]));
        continue;
      }
      flushBullets();
      blocks.add(_startsWithLetter.hasMatch(line) ? p([.text(line)]) : h3([.text(line)]));
    }
    flushBullets();
    return blocks;
  }

  static final _startsWithLetter = RegExp(r'^[A-Za-z]');

  /// Bolds the "Label:" part of a "Label: description" bullet.
  static Component _bullet(String text) {
    final colon = text.indexOf(':');
    if (colon <= 0) return .text(text);
    return .fragment([
      strong([.text(text.substring(0, colon + 1))]),
      .text(text.substring(colon + 1)),
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
    css('.about-text', [
      css('&').styles(maxWidth: 900.px, fontSize: 15.px, lineHeight: 1.7.em),
      css('p').styles(
        margin: .only(top: .zero, bottom: defaultPadding.px),
      ),
      css('h3').styles(
        margin: .only(top: (defaultPadding * 1.5).px, bottom: (defaultPadding / 2).px),
        fontSize: 18.px,
      ),
      css('ul').styles(
        padding: .only(left: 1.2.em),
        margin: .only(top: .zero, bottom: defaultPadding.px),
      ),
      css('li').styles(margin: .only(bottom: 8.px)),
      css('strong').styles(fontWeight: .w700),
    ]),
    css.media(maxWidth(desktopMin - 1), [
      css('.about-title').styles(fontSize: 40.px),
      css('.about-text').styles(fontSize: 14.px),
    ]),
    css.media(maxWidth(largeMobileMax), [
      css('.about-title').styles(fontSize: 35.px),
      css('.about-text').styles(fontSize: 14.px),
    ]),
  ];
}
