class PackageModel {
  final String name;
  final String description;
  final String pubDevLink;
  final String gitLink;
  PackageModel(this.name, this.description, this.pubDevLink, [this.gitLink = '']);
}

// Packages Links
List<PackageModel> packageList = [
  PackageModel(
    'Call Slider Button',
    'A beautiful, fully customizable Flutter widget that mimics an incoming call slider — swipe right to accept, swipe left to decline.',
    'https://pub.dev/packages/call_slider_button',
  ),
  PackageModel(
    'Bouncing Call Slider',
    'A highly customizable Flutter widget that mimics an incoming call slider — swipe up to answer or down to decline with bouncing, animated, and haptic feedback effects.',
    'https://pub.dev/packages/bouncing_call_slider',
  ),
  PackageModel(
    'Flutter Staggered Animations Plus',
    'Easily add staggered animations to your ListView, GridView, Column and Row children. A modernized fork of flutter_staggered_animations with Dart 3+ and Flutter 3.x support.',
    'https://pub.dev/packages/flutter_staggered_animations_plus',
    'https://github.com/OmerJahangir/flutter_staggered_animations_plus',
  ),
];
