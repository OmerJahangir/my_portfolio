import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/links.dart';
import '../styles/theme.dart';

/// LinkedIn and GitHub icon links.
class SocialIcons extends StatelessComponent {
  const SocialIcons({this.size = 20, this.vertical = false, super.key});

  final int size;
  final bool vertical;

  @override
  Component build(BuildContext context) {
    return div(classes: vertical ? 'social-icons vertical' : 'social-icons', [
      _icon(linkedInUrl, 'assets/icons/linkedin.svg', 'LinkedIn'),
      _icon(gitHubUrl, 'assets/icons/github.svg', 'GitHub'),
    ]);
  }

  Component _icon(String href, String src, String label) {
    return a(
      href: href,
      target: .blank,
      attributes: {'rel': 'noopener', 'aria-label': label, 'title': label},
      classes: 'social-icon',
      [img(src: src, alt: '', width: size, height: size, classes: 'white-icon')],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.social-icons').styles(
      display: .flex,
      justifyContent: .center,
      alignItems: .center,
      gap: .all(12.px),
    ),
    css('.social-icons.vertical').styles(flexDirection: .column, gap: .all(16.px)),
    css('.social-icon', [
      css('&').styles(
        display: .flex,
        padding: .all(6.px),
        radius: .circular(20.px),
        transition: .new('transform', duration: 200.ms),
      ),
      css('&:hover').styles(transform: .scale(1.15)),
    ]),
  ];
}

/// Vertical "Follow Me" rail beside the intro (hidden on small screens).
class FollowMeRail extends StatelessComponent {
  const FollowMeRail({super.key});

  @override
  Component build(BuildContext context) {
    return aside(classes: 'follow-rail fade-up', [
      span(classes: 'follow-text', [.text('Follow Me')]),
      div(classes: 'follow-line', []),
      const SocialIcons(vertical: true),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.follow-rail').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      justifyContent: .center,
      gap: .all((defaultPadding * 0.6).px),
    ),
    css('.follow-text').styles(
      fontSize: 25.px,
      fontWeight: .w500,
      raw: {'writing-mode': 'vertical-rl'},
    ),
    css('.follow-line').styles(
      width: 3.px,
      height: 6.vh,
      radius: .circular(defaultPadding.px),
      backgroundColor: Colors.white,
    ),
    css.media(maxWidth(largeMobileMax), [css('.follow-rail').styles(display: .none)]),
  ];
}
