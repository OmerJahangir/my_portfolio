class PackageModel {
  final String name;
  final String description;
  final String pubDevLink;
  PackageModel(this.name, this.description, this.pubDevLink);
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
];
