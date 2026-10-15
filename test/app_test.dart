import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/jaspr_test.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/data/links.dart';
import 'package:my_portfolio/data/packages_model.dart';
import 'package:my_portfolio/data/project_model.dart';
import 'package:my_portfolio/sections/item_card.dart';

Finder _withClass<T extends Component>(String className) => find.byComponentPredicate(
  (c) => c is T && _classesOf(c).split(' ').contains(className),
  description: '$T.$className',
);

String _classesOf(Component c) => switch (c) {
  aside(:final classes) => classes ?? '',
  button(:final classes) => classes ?? '',
  _ => '',
};

void main() {
  testComponents('renders every section, card and external link', (tester) async {
    tester.pumpComponent(const App());

    for (final id in ['home', 'projects', 'packages', 'about']) {
      expect(find.byComponentPredicate((c) => c is section && c.id == id), findsOneComponent, reason: id);
    }
    expect(find.byType(ItemCard), findsNComponents(projectList.length + packageList.length));
    expect(find.text('Senior Flutter Engineer'), findsOneComponent);

    final hrefs = [
      for (final element in find.byType(a).evaluate()) (element.component as a).href,
    ];
    expect(hrefs, containsAll([linkedInUrl, gitHubUrl, whatsAppUrl, cvUrl, '#projects', '#about']));
    for (final project in projectList) {
      for (final link in [project.iosLink, project.androidLink, project.gitLink].where((l) => l.isNotEmpty)) {
        expect(hrefs, contains(link), reason: project.name);
      }
    }
    expect(hrefs.where((h) => !h.startsWith('#')), everyElement(matches(RegExp(r'^(https:|mailto:|tel:)'))));
  });

  testComponents('menu button opens and closes the drawer', (tester) async {
    tester.pumpComponent(const App());
    expect(_withClass<aside>('open'), findsNothing);

    await tester.click(_withClass<button>('menu-button'));
    expect(_withClass<aside>('open'), findsOneComponent);

    await tester.click(_withClass<button>('drawer-close'));
    expect(_withClass<aside>('open'), findsNothing);
  });
}
