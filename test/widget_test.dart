import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/view/1_home/home.dart';
import 'package:my_portfolio/view/splash/splash_view.dart';

void main() {
  setUpAll(() {
    // Tests have no network; fall back to the default font instead of fetching.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('splash screen navigates to the home page', (tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // The test font renders every glyph as a wide square, so text rows that fit
    // with Open Sans overflow here. Ignore only overflow errors; anything else
    // still fails the test.
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      originalOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = originalOnError);

    await tester.pumpWidget(const MyApp());
    expect(find.byType(SplashView), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(HomePage), findsOneWidget);
  });
}
