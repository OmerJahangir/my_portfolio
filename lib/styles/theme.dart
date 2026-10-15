import 'package:jaspr/dom.dart';

// Colours carried over from the Flutter app (lib/res/constants.dart and the
// Material colours it used inline).
const primaryColor = Colors.white;
const secondaryColor = Color('#242430');
const darkColor = Color('#191923');
const bodyTextColor = Color('#8B8B8D');
const bgColor = Color('#000515');

const pink = Color('#E91E63'); // Colors.pink
const pinkAccent = Color('#FF4081'); // Colors.pinkAccent
const blue = Color('#2196F3'); // Colors.blue
const blueDark = Color('#0D47A1'); // Colors.blue.shade900
const cyanAccent = Color('#18FFFF'); // Colors.cyanAccent
const amberAccent = Color('#FFD740'); // Colors.amberAccent

/// Base spacing unit, `defaultPadding` in the Flutter app.
const defaultPadding = 20;

// Breakpoints from the Flutter `Responsive` widget.
const smallMobileMax = 375;
const largeMobileMax = 700;
const desktopMin = 1080;
const extraLargeMin = 1400;

MediaQuery maxWidth(int px) => MediaQuery.screen(maxWidth: px.px);
MediaQuery minWidth(int px) => MediaQuery.screen(minWidth: px.px);

/// Gradient used for buttons and avatar frames.
const buttonGradient = 'linear-gradient(135deg, #E91E63, #0D47A1)';

/// Pink → blue text gradient (Flutter `ShaderMask`).
const textGradient = 'linear-gradient(90deg, #E91E63, #2196F3)';

/// Global page styles.
@css
List<StyleRule> get styles => [
  css.import('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;400;500;700;800&display=swap'),
  css('*, *::before, *::after').styles(boxSizing: .borderBox),
  css('html').styles(raw: {'scroll-behavior': 'smooth'}),
  css('html, body').styles(
    padding: .zero,
    margin: .zero,
    color: primaryColor,
    fontFamily: const .list([FontFamily('Open Sans'), FontFamilies.sansSerif]),
    backgroundColor: bgColor,
  ),
  css('body').styles(
    minHeight: 100.vh,
    backgroundImage: .url('assets/images/bg.svg'),
    backgroundPosition: .center,
    backgroundAttachment: .fixed,
    backgroundSize: .cover,
  ),
  css('a').styles(color: .inherit, textDecoration: .none),
  css('img').styles(display: .block, maxWidth: 100.percent),
  css('section[id]').styles(raw: {'scroll-margin-top': '110px'}),
  css(':focus-visible').styles(raw: {'outline': '2px solid #18FFFF', 'outline-offset': '3px'}),
  css('.gradient-text').styles(
    color: Colors.transparent,
    raw: {
      'background': textGradient,
      '-webkit-background-clip': 'text',
      'background-clip': 'text',
    },
  ),
  css('.white-icon').styles(raw: {'filter': 'brightness(0) invert(1)'}),
  css.keyframes('fade-up', {
    'from': Styles(opacity: 0, transform: .translate(y: 12.px)),
    'to': Styles(opacity: 1, transform: .translate(y: .zero)),
  }),
  css('.fade-up').styles(raw: {'animation': 'fade-up 0.5s ease-out both'}),
  css.media(MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
    css('*, *::before, *::after').styles(
      raw: {
        'animation-duration': '0.01ms !important',
        'animation-iteration-count': '1 !important',
        'transition-duration': '0.01ms !important',
      },
    ),
    css('html').styles(raw: {'scroll-behavior': 'auto'}),
  ]),
];
