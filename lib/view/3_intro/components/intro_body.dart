import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    if (!Responsive.isDesktop(context)) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GlassMorphism(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding - 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (Responsive.isSmallMobile(context)) ...[
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ] else ...[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],

                  const AnimatedImageContainer(
                    width: 100,
                    height: 130,
                  ),
                  if (Responsive.isSmallMobile(context)) ...[
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ] else ...[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],

                  const Responsive(
                      desktop: MyPortfolioText(start: 40, end: 50),
                      largeMobile: MyPortfolioText(start: 40, end: 35),
                      mobile: MyPortfolioText(start: 35, end: 30),
                      tablet: MyPortfolioText(start: 50, end: 40)),
                  // if (kIsWeb && Responsive.isLargeMobile(context))
                  //   Container(
                  //     height: defaultPadding,
                  //     color: Colors.transparent,
                  //   ),
                  // const CombineSubtitleText(),
                  const SizedBox(height: defaultPadding),
                  const Responsive(
                    desktop: AnimatedDescriptionText(start: 14, end: 15),
                    largeMobile: Expanded(
                        child: AnimatedDescriptionText(start: 14, end: 12)),
                    mobile: AnimatedDescriptionText(start: 16, end: 14),
                    tablet: AnimatedDescriptionText(start: 17, end: 14),
                    smallMobile: AnimatedDescriptionText(start: 12, end: 8),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const SizedBox(
                      width: 200, child: Center(child: DownloadButton())),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: size.height * 0.7,
      child: GlassMorphism(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!Responsive.isDesktop(context))
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                  if (!Responsive.isDesktop(context))
                    const Row(
                      children: [
                        // SizedBox(
                        //   width: size.width * 0.23,
                        // ),
                        AnimatedImageContainer(
                          width: 150,
                          height: 200,
                        ),
                      ],
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!Responsive.isDesktop(context))
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                      const Responsive(
                        desktop: MyPortfolioText(start: 40, end: 50),
                        largeMobile: MyPortfolioText(start: 40, end: 35),
                        mobile: MyPortfolioText(start: 35, end: 30),
                        tablet: MyPortfolioText(start: 50, end: 40),
                      ),
                      if (kIsWeb && Responsive.isLargeMobile(context))
                        Container(
                          height: defaultPadding,
                          color: Colors.transparent,
                        ),
                      // const CombineSubtitleText(),
                      const SizedBox(height: defaultPadding),
                      const Responsive(
                        desktop: AnimatedDescriptionText(start: 14, end: 15),
                        largeMobile:
                            AnimatedDescriptionText(start: 14, end: 12),
                        mobile: AnimatedDescriptionText(start: 14, end: 12),
                        tablet: AnimatedDescriptionText(start: 17, end: 14),
                      ),
                      const SizedBox(
                        height: defaultPadding * 2,
                      ),
                      const DownloadButton(),
                    ],
                  ),
                ],
              ),
              // const SizedBox(
              //   width: defaultPadding,
              // ),
              const Spacer(),
              if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

// class IntroBodyMobile extends StatelessWidget {
//   const IntroBodyMobile({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);
//     return SizedBox(
//       height: size.height * 0.7,
//       child: GlassMorphism(
//         blur: 10,
//         color: Colors.white,
//         opacity: 0.2,
//         borderRadius: BorderRadius.circular(12),
//         child: Row(
//           // mainAxisSize: MainAxisSize.min,
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (!Responsive.isDesktop(context))
//                   SizedBox(
//                     height: size.height * 0.06,
//                   ),
//                 if (!Responsive.isDesktop(context))
//                   Row(
//                     children: [
//                       // SizedBox(
//                       //   width: size.width * 0.23,
//                       // ),
//                       const AnimatedImageContainer(
//                         width: 150,
//                         height: 200,
//                       ),
//                     ],
//                   ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     if (!Responsive.isDesktop(context))
//                       SizedBox(
//                         height: size.height * 0.1,
//                       ),
//                     const Responsive(
//                         desktop: MyPortfolioText(start: 40, end: 50),
//                         largeMobile: MyPortfolioText(start: 40, end: 35),
//                         mobile: MyPortfolioText(start: 35, end: 30),
//                         tablet: MyPortfolioText(start: 50, end: 40)),
//                     if (kIsWeb && Responsive.isLargeMobile(context))
//                       Container(
//                         height: defaultPadding,
//                         color: Colors.transparent,
//                       ),
//                     // const CombineSubtitleText(),
//                     const SizedBox(height: defaultPadding / 2),
//                     const Responsive(
//                       desktop: AnimatedDescriptionText(start: 14, end: 15),
//                       largeMobile: AnimatedDescriptionText(start: 14, end: 12),
//                       mobile: AnimatedDescriptionText(start: 14, end: 12),
//                       tablet: AnimatedDescriptionText(start: 17, end: 14),
//                     ),
//                     const SizedBox(
//                       height: defaultPadding * 2,
//                     ),
//                     const DownloadButton(),
//                   ],
//                 ),
//               ],
//             ),
//             const Spacer(),
//             if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
//             const Spacer()
//           ],
//         ),
//       ),
//     );
//   }
// }
