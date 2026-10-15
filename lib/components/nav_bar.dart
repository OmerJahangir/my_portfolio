import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/links.dart';
import '../styles/theme.dart';
import 'side_drawer.dart';

const _sections = [
  (id: 'home', label: 'Home'),
  (id: 'projects', label: 'Projects'),
  (id: 'packages', label: 'Flutter Packages'),
  (id: 'about', label: 'About'),
];

/// Sticky glass header: drawer button, section links and WhatsApp button.
class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'nav-bar', [
        const SideDrawer(),
        nav(
          classes: 'nav-links',
          attributes: {'aria-label': 'Sections'},
          [
            for (final section in _sections) a(href: '#${section.id}', classes: 'nav-link', [.text(section.label)]),
          ],
        ),
        a(
          href: whatsAppUrl,
          target: .blank,
          attributes: {'rel': 'noopener'},
          classes: 'gradient-button whatsapp-button',
          [
            img(src: 'assets/icons/whatsapp.svg', alt: '', width: 15, height: 15),
            span([.text('Whatsapp')]),
          ],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-header').styles(
      position: .sticky(top: .zero),
      zIndex: ZIndex(50),
      padding: .symmetric(horizontal: 6.vw, vertical: defaultPadding.px),
    ),
    // The glass effect sits on a ::before layer: a backdrop-filter on the bar
    // itself would trap the drawer's `position: fixed` inside the bar.
    css('.nav-bar::before').styles(
      content: '""',
      position: .absolute(top: .zero, left: .zero, right: .zero, bottom: .zero),
      zIndex: ZIndex(-1),
      border: .all(width: 2.px, color: const Color.rgba(255, 255, 255, 0.3)),
      radius: .circular(12.px),
      backgroundColor: const Color.rgba(255, 255, 255, 0.2),
      raw: {'backdrop-filter': 'blur(10px)', '-webkit-backdrop-filter': 'blur(10px)'},
    ),
    css('.nav-bar').styles(
      display: .flex,
      position: .relative(),
      zIndex: ZIndex(0),
      minHeight: 76.px,
      padding: .symmetric(vertical: 8.px),
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      alignItems: .center,
      gap: .all(8.px),
    ),
    css('.nav-links').styles(
      display: .flex,
      justifyContent: .center,
      alignItems: .center,
      flex: Flex(grow: 1),
      gap: .all(4.px),
    ),
    css('.nav-link', [
      css('&').styles(
        padding: .symmetric(horizontal: 12.px, vertical: 10.px),
        radius: .circular(20.px),
        transition: .new('background-color', duration: 200.ms),
        fontSize: 12.px,
        fontWeight: .bold,
        whiteSpace: .noWrap,
      ),
      css('&:hover').styles(backgroundColor: const Color.rgba(255, 255, 255, 0.1)),
    ]),
    css('.gradient-button', [
      css('&').styles(
        display: .inlineFlex,
        justifyContent: .center,
        alignItems: .center,
        gap: .all((defaultPadding / 4).px),
        radius: .circular(defaultPadding.px),
        transition: .new('transform', duration: 200.ms),
        fontSize: 11.px,
        fontWeight: .bold,
        letterSpacing: 1.2.px,
        raw: {'background': buttonGradient, 'box-shadow': '0 -1px 5px #2196F3, 0 1px 5px #F44336'},
      ),
      css('&:hover').styles(transform: .scale(1.04)),
    ]),
    css('.whatsapp-button').styles(
      width: 150.px,
      height: 60.px,
      margin: .only(right: defaultPadding.px),
    ),
    // Small screens: links drop into their own scrollable row under the bar.
    css.media(maxWidth(largeMobileMax), [
      css('.nav-links').styles(
        order: 3,
        width: 100.percent,
        overflow: .only(x: .auto),
        justifyContent: .start,
        flex: Flex(basis: 100.percent),
        raw: {'scrollbar-width': 'none'},
      ),
      css('.whatsapp-button').styles(width: 130.px, height: 48.px),
    ]),
  ];
}
