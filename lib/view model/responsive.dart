import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.desktop,
      required this.largeMobile,
      required this.mobile,
      required this.tablet,
      this.smallMobile,
      this.extraLargeScreen});
  final Widget desktop;
  final Widget? largeMobile;
  final Widget mobile;
  final Widget? smallMobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;
  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 375;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 500;
  }

  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 700;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1080;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1024;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1400;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1400 && extraLargeScreen != null) {
      return extraLargeScreen!;
    } else if (size.width >= 1080) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && largeMobile != null) {
      return largeMobile!;
    } else if (size.width < 375 && smallMobile != null) {
      return smallMobile!;
    } else {
      return mobile;
    }
  }
}

//--------------

// import 'package:flutter/material.dart';

// class Responsive extends StatelessWidget {
//   const Responsive({
//     super.key,
//     required this.desktop,
//     required this.mobile,
//     this.largeMobile,
//     this.smallMobile,
//     this.tablet,
//     this.extraLargeScreen,
//   });

//   // Widgets for different breakpoints
//   final Widget desktop;
//   final Widget mobile;
//   final Widget? largeMobile;
//   final Widget? smallMobile;
//   final Widget? tablet;
//   final Widget? extraLargeScreen;

//   // Breakpoint constants
//   static const double smallMobileMax = 374;
//   static const double mobileMax = 499;
//   static const double largeMobileMax = 699;
//   static const double tabletMax = 1079;
//   static const double desktopMax = 1399;

//   // Helper methods
//   static bool isSmallMobile(BuildContext context) =>
//       MediaQuery.sizeOf(context).width <= smallMobileMax;

//   static bool isMobile(BuildContext context) {
//     double w = MediaQuery.sizeOf(context).width;
//     return w > smallMobileMax && w <= mobileMax;
//   }

//   static bool isLargeMobile(BuildContext context) {
//     double w = MediaQuery.sizeOf(context).width;
//     return w > mobileMax && w <= largeMobileMax;
//   }

//   static bool isTablet(BuildContext context) {
//     double w = MediaQuery.sizeOf(context).width;
//     return w > largeMobileMax && w <= tabletMax;
//   }

//   static bool isDesktop(BuildContext context) {
//     double w = MediaQuery.sizeOf(context).width;
//     return w > tabletMax && w <= desktopMax;
//   }

//   static bool isExtraLargeScreen(BuildContext context) =>
//       MediaQuery.sizeOf(context).width > desktopMax;

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;

//     if (width > desktopMax && extraLargeScreen != null) {
//       return extraLargeScreen!;
//     } else if (width > tabletMax) {
//       return desktop;
//     } else if (width > largeMobileMax && tablet != null) {
//       return tablet!;
//     } else if (width > mobileMax && largeMobile != null) {
//       return largeMobile!;
//     } else if (width <= smallMobileMax && smallMobile != null) {
//       return smallMobile!;
//     } else {
//       return mobile;
//     }
//   }
// }
