import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../styles/theme.dart';

/// "Latest **Projects**" style heading with a gradient on the second word.
class SectionTitle extends StatelessComponent {
  const SectionTitle({required this.prefix, required this.title, super.key});

  final String prefix;
  final String title;

  @override
  Component build(BuildContext context) {
    return h2(classes: 'section-title fade-up', [
      .text('$prefix '),
      span(classes: 'title-gradient', [.text(title)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.section-title').styles(
      margin: .only(bottom: defaultPadding.px),
      textAlign: .center,
      fontSize: 50.px,
      fontWeight: .bold,
    ),
    css('.title-gradient').styles(
      color: Colors.transparent,
      raw: {
        'background': 'linear-gradient(90deg, #E91E63, #18FFFF)',
        '-webkit-background-clip': 'text',
        'background-clip': 'text',
      },
    ),
    css.media(maxWidth(desktopMin - 1), [css('.section-title').styles(fontSize: 30.px)]),
    css.media(maxWidth(largeMobileMax), [css('.section-title').styles(fontSize: 20.px)]),
  ];
}
