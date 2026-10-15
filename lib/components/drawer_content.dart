import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/links.dart';
import '../styles/theme.dart';
import 'social_links.dart';

typedef _Skill = ({String title, double percentage, String icon});

const List<_Skill> _skills = [
  (title: 'Flutter', percentage: 0.99, icon: 'assets/icons/flutter.png'),
  (title: 'Dart', percentage: 0.99, icon: 'assets/icons/dart.png'),
  (title: 'Firebase', percentage: 0.8, icon: 'assets/icons/firebase.png'),
  (title: 'Sqlite', percentage: 0.7, icon: 'assets/icons/dart.png'),
  (title: 'Responsive Design', percentage: 0.99, icon: 'assets/icons/flutter.png'),
  (title: 'Clean Architecture', percentage: 0.9, icon: 'assets/icons/flutter.png'),
  (title: 'Provider', percentage: 0.99, icon: 'assets/icons/bloc.png'),
  (title: 'Getx', percentage: 0.98, icon: 'assets/icons/dart.png'),
];

const List<String> _knowledge = [
  'Flutter, Dart,Swift,Kotlin',
  'REST APIs, Postman,Flavors',
  'Call SDKs (Vonage, Telnyx, etc)',
  'Firebase (Auth, Firestore, FCM, Analytics)',
  'Firebase (Google Maps, Stripe, Converge)',
  'Firebase (Agile, Scrum methodology)',
  'Github',
];

/// Profile, contact details, skills and knowledge shown in the side drawer.
class DrawerContent extends StatelessComponent {
  const DrawerContent({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'drawer-content', [
      div(classes: 'drawer-profile', [
        div(classes: 'drawer-avatar', [
          img(src: 'assets/images/profile_pic.png', alt: 'Muhammad Omer Jahangir', width: 94, height: 94),
        ]),
        h2(classes: 'drawer-name', [.text('Muhammad Omer Jahangir')]),
        p(classes: 'drawer-role', [.text('Flutter Developer'), br(), .text('Software Engineering')]),
      ]),
      dl(classes: 'drawer-info', [
        _info('Contact', a(href: 'tel:+923017426900', [.text('+92301-7426900')])),
        _info('Email', a(href: 'mailto:omerjahangir31@gmail.com', [.text('omerjahangir31@gmail.com')])),
        _info('LinkedIn', a(href: linkedInUrl, target: .blank, [.text('@OmerJahangir')])),
        _info('Github', a(href: gitHubUrl, target: .blank, [.text('@OmerJahangir')])),
      ]),
      h3(classes: 'drawer-heading', [.text('Skills')]),
      ul(classes: 'skills', [for (final skill in _skills) _skill(skill)]),
      hr(),
      h3(classes: 'drawer-heading', [.text('Knowledge')]),
      ul(classes: 'knowledge', [
        for (final item in _knowledge)
          li([
            img(src: 'assets/icons/check.svg', alt: '', width: 16, height: 16),
            span([.text(item)]),
          ]),
      ]),
      hr(),
      const SocialIcons(size: 30),
    ]);
  }

  Component _info(String title, Component value) {
    return div(classes: 'info-row', [
      dt([.text(title)]),
      dd([value]),
    ]);
  }

  Component _skill(_Skill skill) {
    final percent = (skill.percentage * 100).round();
    return li(classes: 'skill', [
      div(classes: 'skill-label', [
        img(src: skill.icon, alt: '', width: 15, height: 15),
        span([.text(skill.title)]),
        span(classes: 'skill-percent', [.text('$percent%')]),
      ]),
      div(
        classes: 'skill-track',
        attributes: {
          'role': 'progressbar',
          'aria-label': skill.title,
          'aria-valuenow': '$percent',
          'aria-valuemin': '0',
          'aria-valuemax': '100',
        },
        [
          div(classes: 'skill-bar', styles: Styles(width: percent.percent), [
            div(classes: 'skill-fill', []),
          ]),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.drawer-content').styles(padding: .all((defaultPadding / 2).px), fontSize: 14.px),
    css('.drawer-profile').styles(
      display: .flex,
      padding: .only(top: 36.px, bottom: defaultPadding.px),
      flexDirection: .column,
      alignItems: .center,
      textAlign: .center,
    ),
    css('.drawer-avatar', [
      css('&').styles(
        width: 100.px,
        height: 100.px,
        padding: .all(3.px),
        radius: .circular(50.px),
        raw: {
          'background': buttonGradient,
          'box-shadow': '0 2px 10px #E91E63, 0 -2px 10px #2196F3',
        },
      ),
      css('img').styles(
        width: 100.percent,
        height: 100.percent,
        radius: .circular(50.px),
        transform: .rotate(0.1.rad),
        raw: {'object-fit': 'cover'},
      ),
    ]),
    css('.drawer-name').styles(
      margin: .only(top: defaultPadding.px, bottom: 5.px),
      fontSize: 14.px,
      fontWeight: .w500,
    ),
    css('.drawer-role').styles(margin: .zero, fontWeight: .w200, lineHeight: 1.5.em),
    css('.drawer-info').styles(margin: .zero),
    css('.info-row', [
      css('&').styles(
        display: .flex,
        margin: .only(bottom: (defaultPadding / 2).px),
        justifyContent: .spaceBetween,
        gap: .all(8.px),
      ),
      css('dd').styles(margin: .zero, raw: {'overflow-wrap': 'anywhere'}),
    ]),
    css('.drawer-heading').styles(
      margin: .symmetric(vertical: 14.px),
      fontSize: 14.px,
      fontWeight: .w400,
    ),
    css('.skills, .knowledge').styles(padding: .zero, margin: .zero, listStyle: .none),
    css('.skill').styles(margin: .only(bottom: (defaultPadding / 2).px)),
    css('.skill-label').styles(
      display: .flex,
      margin: .only(bottom: (defaultPadding / 2).px),
      alignItems: .center,
      gap: .all(5.px),
    ),
    css('.skill-percent').styles(margin: .only(left: .auto)),
    css('.skill-track').styles(height: 4.px, overflow: .hidden, backgroundColor: Colors.black),
    css('.skill-bar').styles(height: 100.percent),
    css('.skill-fill').styles(
      height: 100.percent,
      transition: .new('transform', duration: 1.seconds, curve: .easeOut),
      backgroundColor: amberAccent,
      raw: {'transform': 'scaleX(0)', 'transform-origin': 'left'},
    ),
    css('.knowledge li').styles(
      display: .flex,
      margin: .only(bottom: (defaultPadding / 2).px),
      alignItems: .center,
      gap: .all((defaultPadding / 2).px),
    ),
    css('.drawer-content hr').styles(
      margin: .symmetric(vertical: defaultPadding.px),
      border: .none,
      height: 1.px,
      backgroundColor: const Color.rgba(255, 255, 255, 0.2),
    ),
  ];
}
