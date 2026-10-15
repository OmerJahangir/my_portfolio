import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/section_title.dart';
import '../data/packages_model.dart';
import '../data/project_model.dart';
import '../styles/theme.dart';
import 'item_card.dart';

/// Titled responsive grid of [ItemCard]s (4 / 3 / 2 / 1 columns).
class CardsSection extends StatelessComponent {
  const CardsSection({required this.id, required this.title, required this.cards, super.key});

  final String id;
  final String title;
  final List<ItemCard> cards;

  @override
  Component build(BuildContext context) {
    return section(id: id, classes: 'cards-section', [
      SectionTitle(prefix: 'Latest', title: title),
      div(classes: 'card-grid', cards),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.cards-section').styles(
      padding: .symmetric(horizontal: 6.vw, vertical: (defaultPadding * 2).px),
    ),
    css('.card-grid').styles(
      display: .grid,
      padding: .symmetric(horizontal: 30.px),
      gap: .all((defaultPadding * 2).px),
      raw: {'grid-template-columns': 'repeat(3, minmax(0, 1fr))', 'grid-auto-rows': 'minmax(240px, auto)'},
    ),
    css.media(minWidth(extraLargeMin + 1), [
      css('.card-grid').styles(raw: {'grid-template-columns': 'repeat(4, minmax(0, 1fr))'}),
    ]),
    css.media(maxWidth(desktopMin - 1), [
      css('.card-grid').styles(raw: {'grid-template-columns': 'repeat(2, minmax(0, 1fr))'}),
    ]),
    css.media(maxWidth(largeMobileMax - 1), [
      css('.card-grid').styles(padding: .zero, raw: {'grid-template-columns': 'minmax(0, 1fr)'}),
    ]),
  ];
}

/// "Latest Projects": the apps in [projectList].
Component projectsSection() => CardsSection(
  id: 'projects',
  title: 'Projects',
  cards: [
    for (final project in projectList)
      ItemCard(
        name: project.name,
        description: project.description,
        links: [
          if (project.iosLink.isNotEmpty)
            (href: project.iosLink, icon: 'assets/icons/appstore_icon.svg', label: 'App Store', whiteIcon: false),
          if (project.androidLink.isNotEmpty)
            (
              href: project.androidLink,
              icon: 'assets/icons/playstore_icon.svg',
              label: 'Google Play',
              whiteIcon: false,
            ),
          if (project.gitLink.isNotEmpty)
            (href: project.gitLink, icon: 'assets/icons/github.svg', label: 'GitHub', whiteIcon: true),
        ],
      ),
  ],
);

/// "Latest Packages": the Flutter packages in [packageList].
Component packagesSection() => CardsSection(
  id: 'packages',
  title: 'Packages',
  cards: [
    for (final package in packageList)
      ItemCard(
        name: package.name,
        description: package.description,
        links: [(href: package.pubDevLink, icon: 'assets/icons/dart.png', label: 'pub.dev', whiteIcon: false)],
      ),
  ],
);
