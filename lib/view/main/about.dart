import 'package:flutter/material.dart';
import 'package:my_portfolio/res/constants.dart';
import 'package:my_portfolio/res/glass_widget.dart';

import '../../view model/responsive.dart';
import '../intro/components/subtitle_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        // SizedBox(
        //   width: size.width * 0.04,
        // ),
        const Spacer(),
        Column(
          children: [
            if (Responsive.isSmallMobile(context)) ...{
              SizedBox(
                height: size.height * 0.01,
              ),
            } else ...{
              SizedBox(
                height: size.height * 0.1,
              ),
            },
            SizedBox(
              width: size.width * 0.77,
              child: GlassMorphism(
                blur: 10,
                color: Colors.white,
                opacity: 0.2,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Responsive(
                        desktop: AnimatedSubtitleText(
                            start: 40, end: 50, text: "About Us"),
                        largeMobile: AnimatedSubtitleText(
                            start: 40, end: 35, text: "About Us"),
                        mobile: AnimatedSubtitleText(
                            start: 35, end: 30, text: "About Us"),
                        tablet: AnimatedSubtitleText(
                            start: 50, end: 40, text: "About Us"),
                      ),
                      // Text(
                      //   'About Us',
                      //   style: Theme.of(context).textTheme.headlineMedium,
                      // ),
                      const SizedBox(height: defaultPadding),

                      const Responsive(
                        desktop: AnimatedSubtitleText(
                            start: 14,
                            end: 15,
                            text:
                                'Welcome to My Portfolio! We are dedicated to showcasing the best projects and skills. Our mission is to provide a platform where creativity and technical expertise come together to create amazing digital experiences.'),
                        largeMobile: AnimatedSubtitleText(
                            start: 14,
                            end: 12,
                            text:
                                'Welcome to My Portfolio! We are dedicated to showcasing the best projects and skills. Our mission is to provide a platform where creativity and technical expertise come together to create amazing digital experiences.'),
                        mobile: AnimatedSubtitleText(
                            start: 14,
                            end: 12,
                            text:
                                'Welcome to My Portfolio! We are dedicated to showcasing the best projects and skills. Our mission is to provide a platform where creativity and technical expertise come together to create amazing digital experiences.'),
                        tablet: AnimatedSubtitleText(
                            start: 17,
                            end: 14,
                            text:
                                'Welcome to My Portfolio! We are dedicated to showcasing the best projects and skills. Our mission is to provide a platform where creativity and technical expertise come together to create amazing digital experiences.'),
                      ),

                      const SizedBox(height: defaultPadding),
                      Text(
                        'Our team consists of passionate developers, designers, and content creators who work tirelessly to bring you the best content. We believe in continuous learning and improvement, and we strive to stay at the forefront of technology and design trends.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: defaultPadding),
                      Text(
                        'Thank you for visiting our portfolio. We hope you enjoy exploring our projects as much as we enjoyed creating them!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
        // SizedBox(
        //   width: size.width * 0.03,
        // ),
        const Spacer()
      ],
    );
  }
}
