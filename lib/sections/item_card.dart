import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/glass_card.dart';
import '../styles/theme.dart';

/// An icon link on an [ItemCard], e.g. App Store or pub.dev.
typedef CardLink = ({String href, String icon, String label, bool whiteIcon});

/// Glass card for a project or package: name, clamped description, links.
class ItemCard extends StatelessComponent {
  const ItemCard({required this.name, required this.description, required this.links, super.key});

  final String name;
  final String description;
  final List<CardLink> links;

  @override
  Component build(BuildContext context) {
    return GlassCard(dark: true, classes: 'item-card', [
      h3(classes: 'item-name', attributes: {'title': name}, [.text(name)]),
      p(classes: 'item-description', [.text(description)]),
      div(classes: 'item-links', [
        span([.text('Links')]),
        for (final link in links)
          a(
            href: link.href,
            target: .blank,
            attributes: {'rel': 'noopener', 'aria-label': '$name on ${link.label}', 'title': link.label},
            classes: 'item-link',
            [img(src: link.icon, alt: '', width: 30, height: 30, classes: link.whiteIcon ? 'white-icon' : null)],
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.item-card', [
      css('&').styles(
        display: .flex,
        padding: .only(left: defaultPadding.px, right: defaultPadding.px, top: defaultPadding.px),
        transition: .new('box-shadow', duration: 200.ms),
        flexDirection: .column,
      ),
      css(
        '&:hover',
      ).styles(raw: {'box-shadow': '-2px 0 16px rgba(233, 30, 99, 0.6), 2px 0 16px rgba(33, 150, 243, 0.6)'}),
    ]),
    css('.item-name').styles(
      margin: .only(top: .zero, bottom: (defaultPadding * 0.75).px),
      overflow: .hidden,
      textAlign: .center,
      fontSize: 20.px,
      fontWeight: .bold,
      lineHeight: 1.3.em,
      raw: {'display': '-webkit-box', '-webkit-box-orient': 'vertical', '-webkit-line-clamp': '2', 'line-clamp': '2'},
    ),
    css('.item-description').styles(
      margin: .only(bottom: defaultPadding.px),
      overflow: .hidden,
      fontSize: 15.px,
      lineHeight: 1.5.em,
      raw: {'display': '-webkit-box', '-webkit-box-orient': 'vertical', '-webkit-line-clamp': '4', 'line-clamp': '4'},
    ),
    css('.item-links').styles(
      display: .flex,
      padding: .only(bottom: (defaultPadding / 2).px),
      margin: .only(top: .auto),
      alignItems: .center,
      gap: .all(4.px),
    ),
    css('.item-link', [
      css('&').styles(
        display: .flex,
        padding: .all(8.px),
        radius: .circular(20.px),
        transition: .new('background-color', duration: 200.ms),
      ),
      css('&:hover').styles(backgroundColor: const Color.rgba(255, 255, 255, 0.1)),
      css('img').styles(width: .auto, height: 30.px, raw: {'object-fit': 'contain'}),
    ]),
    css.media(maxWidth(500), [css('.item-description').styles(fontSize: 14.px)]),
  ];
}
