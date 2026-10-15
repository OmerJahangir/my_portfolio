import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

import '../styles/theme.dart';
import 'drawer_content.dart';

/// Menu button plus the slide-out profile drawer.
///
/// The only interactive island on the site: it is pre-rendered closed and
/// hydrated on the client so the button can open it.
@client
class SideDrawer extends StatefulComponent {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();

  @css
  static List<StyleRule> get styles => [
    css('.menu-button', [
      css('&').styles(
        display: .flex,
        width: 40.px,
        height: 40.px,
        border: .none,
        radius: .circular(10.px),
        cursor: .pointer,
        justifyContent: .center,
        alignItems: .center,
        backgroundColor: Colors.transparent,
        raw: {'box-shadow': '1px 1px rgba(255, 64, 129, 0.5), -1px -1px rgba(33, 150, 243, 0.5)'},
      ),
      css('&:hover').styles(backgroundColor: const Color.rgba(255, 255, 255, 0.08)),
    ]),
    // Three-line "hamburger" drawn with CSS so no icon font is needed.
    css('.menu-icon', [
      css('&, &::before, &::after').styles(
        display: .block,
        width: 20.px,
        height: 2.px,
        radius: .circular(1.px),
        backgroundColor: Colors.white,
      ),
      css('&').styles(position: .relative()),
      css('&::before, &::after').styles(content: '""', position: .absolute()),
      css('&::before').styles(raw: {'top': '-6px'}),
      css('&::after').styles(raw: {'top': '6px'}),
    ]),
    css('.drawer-overlay', [
      css('&').styles(
        position: .fixed(top: .zero, left: .zero, right: .zero, bottom: .zero),
        zIndex: ZIndex(90),
        opacity: 0,
        pointerEvents: .none,
        transition: .new('opacity', duration: 300.ms),
        backgroundColor: const Color.rgba(0, 0, 0, 0.5),
      ),
      css('&.open').styles(opacity: 1, pointerEvents: .auto),
    ]),
    css('.drawer', [
      css('&').styles(
        position: .fixed(top: .zero, left: .zero, bottom: .zero),
        zIndex: ZIndex(100),
        width: 304.px,
        maxWidth: 85.vw,
        border: .all(width: 2.px, color: const Color.rgba(255, 255, 255, 0.3)),
        radius: .only(topRight: .circular(17.px), bottomRight: .circular(17.px)),
        overflow: .only(y: .auto),
        transition: .new('transform', duration: 300.ms, curve: .easeOut),
        transform: .translate(x: (-105).percent),
        backgroundColor: const Color.rgba(255, 255, 255, 0.12),
        raw: {'backdrop-filter': 'blur(14px)', '-webkit-backdrop-filter': 'blur(14px)'},
      ),
      css('&.open').styles(transform: .translate(x: .zero)),
    ]),
    css('.drawer-close', [
      css('&').styles(
        position: .absolute(top: 10.px, right: 10.px),
        width: 32.px,
        height: 32.px,
        border: .none,
        radius: .circular(16.px),
        cursor: .pointer,
        color: Colors.white,
        fontSize: 16.px,
        backgroundColor: Colors.transparent,
      ),
      css('&:hover').styles(backgroundColor: const Color.rgba(255, 255, 255, 0.12)),
    ]),
    css('.drawer.open .skill-fill').styles(transform: .scale(1)),
    css.media(maxWidth(smallMobileMax), [css('.drawer').styles(width: 100.vw, maxWidth: 100.vw)]),
    css('.drawer-root').styles(
      display: .flex,
      padding: .only(left: defaultPadding.px),
    ),
  ];
}

class _SideDrawerState extends State<SideDrawer> {
  bool _open = false;
  JSFunction? _keyListener;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _keyListener = ((web.KeyboardEvent event) {
        if (event.key == 'Escape' && _open) _setOpen(false);
      }).toJS;
      web.window.addEventListener('keydown', _keyListener);
    }
  }

  @override
  void dispose() {
    if (_keyListener case final listener?) {
      web.window.removeEventListener('keydown', listener);
    }
    super.dispose();
  }

  void _setOpen(bool open) {
    setState(() => _open = open);
    if (kIsWeb) {
      // Stop the page behind the drawer from scrolling while it is open.
      web.document.body?.style.overflow = open ? 'hidden' : '';
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'drawer-root', [
      button(
        classes: 'menu-button',
        attributes: {
          'aria-label': 'Open profile menu',
          'aria-expanded': '$_open',
          'aria-controls': 'profile-drawer',
        },
        onClick: () => _setOpen(true),
        [span(classes: 'menu-icon', [])],
      ),
      div(
        classes: _open ? 'drawer-overlay open' : 'drawer-overlay',
        attributes: {'aria-hidden': 'true'},
        events: {'click': (_) => _setOpen(false)},
        [],
      ),
      aside(
        id: 'profile-drawer',
        classes: _open ? 'drawer open' : 'drawer',
        attributes: {'aria-label': 'Profile', if (!_open) 'inert': ''},
        [
          button(
            classes: 'drawer-close',
            attributes: {'aria-label': 'Close profile menu'},
            onClick: () => _setOpen(false),
            [.text('✕')],
          ),
          const DrawerContent(),
        ],
      ),
    ]);
  }
}
