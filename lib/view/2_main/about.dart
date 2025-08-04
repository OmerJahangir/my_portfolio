import 'package:flutter/material.dart';
import 'package:my_portfolio/res/constants.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import 'package:my_portfolio/res/my_strings.dart';

import '../../view model/responsive.dart';
import '../3_intro/components/subtitle_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.07,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // if (Responsive.isSmallMobile(context)) ...{
            SizedBox(
              height: size.height * 0.01,
            ),
            // } else ...{
            //   SizedBox(
            //     height: size.height * 0.1,
            //   ),
            // },
            const GlassMorphism(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Responsive(
                      desktop: AnimatedSubtitleText(
                        start: 40,
                        end: 50,
                        text: "About",
                      ),
                      largeMobile: AnimatedSubtitleText(
                        start: 40,
                        end: 35,
                        text: "About",
                      ),
                      mobile: AnimatedSubtitleText(
                        start: 35,
                        end: 30,
                        text: "About",
                      ),
                      tablet: AnimatedSubtitleText(
                        start: 50,
                        end: 40,
                        text: "About",
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Responsive(
                      desktop: AnimatedSubtitleText(
                        start: 14,
                        end: 15,
                        text: MyStringConst.aboutMeFullText,
                      ),
                      largeMobile: AnimatedSubtitleText(
                        start: 14,
                        end: 12,
                        text: MyStringConst.aboutMeFullText,
                      ),
                      mobile: AnimatedSubtitleText(
                        start: 14,
                        end: 12,
                        text: MyStringConst.aboutMeFullText,
                      ),
                      smallMobile: AnimatedSubtitleText(
                        start: 12,
                        end: 10,
                        text: MyStringConst.aboutMeFullText,
                      ),
                      tablet: AnimatedSubtitleText(
                        start: 17,
                        end: 14,
                        text: MyStringConst.aboutMeFullText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
