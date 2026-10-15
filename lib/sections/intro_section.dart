import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/glass_card.dart';
import '../components/social_links.dart';
import '../data/links.dart';
import '../data/my_strings.dart';
import '../styles/theme.dart';

/// Landing section: headline, intro text, CV button and floating avatar.
class IntroSection extends StatelessComponent {
  const IntroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'home', classes: 'intro', [
      const FollowMeRail(),
      GlassCard(classes: 'intro-card fade-up', [
        div(classes: 'intro-avatar', [
          img(src: 'assets/images/image.png', alt: 'Omer Jahangir', width: 200, height: 200),
        ]),
        div(classes: 'intro-text', [
          h1(classes: 'intro-headline', [
            span([.text('My Personal Portfolio')]),
            span(classes: 'gradient-text', [.text('Senior Flutter Engineer')]),
          ]),
          p(classes: 'intro-description', [.text(MyStringConst.portfolioIntro.trim())]),
          a(
            href: cvUrl,
            target: .blank,
            attributes: {'rel': 'noopener'},
            classes: 'gradient-button cv-button',
            [
              span([.text('Download CV')]),
              img(src: 'assets/icons/download.svg', alt: '', width: 16, height: 16, classes: 'white-icon'),
            ],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro').styles(
      display: .flex,
      raw: {'min-height': 'min(75vh, 760px)'},
      padding: .only(left: 2.vw, right: 6.vw, bottom: defaultPadding.px),
      alignItems: .center,
      gap: .all(4.vw),
    ),
    css('.intro-card').styles(
      display: .flex,
      raw: {'min-height': 'min(70vh, 720px)'},
      padding: .symmetric(horizontal: defaultPadding.px, vertical: (defaultPadding * 2).px),
      flexDirection: .rowReverse,
      justifyContent: .spaceAround,
      alignItems: .center,
      flex: Flex(grow: 1),
      gap: .all((defaultPadding * 2).px),
    ),
    css('.intro-text').styles(
      display: .flex,
      maxWidth: 640.px,
      flexDirection: .column,
      alignItems: .start,
      gap: .all(defaultPadding.px),
    ),
    css('.intro-headline', [
      css('&').styles(
        display: .flex,
        margin: .zero,
        flexDirection: .column,
        fontSize: 50.px,
        fontWeight: .w800,
        lineHeight: 1.15.em,
      ),
    ]),
    css('.intro-description').styles(
      margin: .zero,
      fontSize: 15.px,
      lineHeight: 1.6.em,
      wordSpacing: 2.px,
      whiteSpace: .preLine,
    ),
    css('.cv-button').styles(
      padding: .symmetric(horizontal: (defaultPadding * 2).px, vertical: (defaultPadding / 1.5).px),
      margin: .only(top: defaultPadding.px),
    ),
    // Floating avatar in a pink → blue glowing frame.
    css('.intro-avatar', [
      css('&').styles(
        flex: Flex(shrink: 0),
        width: 250.px,
        height: 300.px,
        padding: .all((defaultPadding / 4).px),
        radius: .circular(30.px),
        raw: {
          'background': 'linear-gradient(90deg, #FF4081, #2196F3)',
          'box-shadow': '-2px 0 20px #E91E63, 2px 0 20px #2196F3',
          'animation': 'float 1s ease-in-out infinite alternate',
        },
      ),
      css('img').styles(
        width: 100.percent,
        height: 100.percent,
        padding: .all(defaultPadding.px),
        radius: .circular(30.px),
        backgroundColor: Colors.black,
        raw: {'object-fit': 'contain'},
      ),
    ]),
    css.keyframes('float', {
      'from': Styles(transform: .translate(y: .zero)),
      'to': Styles(transform: .translate(y: 4.px)),
    }),
    css.media(maxWidth(desktopMin - 1), [
      css('.intro-card').styles(flexDirection: .column, textAlign: .center),
      css('.intro-text').styles(alignItems: .center),
      css('.intro-headline').styles(fontSize: 40.px),
      css('.intro-description').styles(fontSize: 14.px),
      css('.intro-avatar').styles(width: 150.px, height: 200.px),
    ]),
    css.media(maxWidth(largeMobileMax), [
      css('.intro').styles(padding: .symmetric(horizontal: 6.vw)),
      css('.intro-headline').styles(fontSize: 35.px),
      css('.intro-description').styles(fontSize: 13.px),
      css('.intro-avatar').styles(width: 100.px, height: 130.px),
      css('.intro-avatar img').styles(padding: .all(8.px)),
    ]),
    css.media(maxWidth(500), [css('.intro-headline').styles(fontSize: 30.px)]),
  ];
}
