import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Frosted-glass panel: blurred backdrop, translucent fill and a light border.
///
/// Port of the Flutter `GlassMorphism` widget. [dark] uses the black tint the
/// project and package cards used; otherwise the panel is tinted white.
class GlassCard extends StatelessComponent {
  const GlassCard(this.children, {this.dark = false, this.classes, super.key});

  final List<Component> children;
  final bool dark;
  final String? classes;

  @override
  Component build(BuildContext context) {
    return div(classes: ['glass', if (dark) 'glass-dark', ?classes].join(' '), children);
  }

  @css
  static List<StyleRule> get styles => [
    css('.glass').styles(
      border: .all(width: 2.px, color: const Color.rgba(255, 255, 255, 0.3)),
      radius: .circular(12.px),
      backgroundColor: const Color.rgba(255, 255, 255, 0.2),
      raw: {'backdrop-filter': 'blur(10px)', '-webkit-backdrop-filter': 'blur(10px)'},
    ),
    css('.glass-dark').styles(
      backgroundColor: const Color.rgba(0, 0, 0, 0.2),
      raw: {'backdrop-filter': 'blur(16px)', '-webkit-backdrop-filter': 'blur(16px)'},
    ),
  ];
}
