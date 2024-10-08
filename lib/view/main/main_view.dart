import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../res/constants.dart';
import '../../view model/controller.dart';
import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_bar.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatelessWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          SvgPicture.asset(
            "images/bg.svg",
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("images/bg.png"), fit: BoxFit.cover),
                ),
            child: Center(
              child: Column(
                children: [
                  kIsWeb && !Responsive.isLargeMobile(context)
                      ? const SizedBox(
                          height: defaultPadding * 2,
                        )
                      : const SizedBox(
                          height: defaultPadding / 2,
                        ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.07,
                      ),
                      child: const TopNavigationBar(),
                    ),
                  ),
                  if (Responsive.isLargeMobile(context)) ...[
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    const Row(
                      children: [Spacer(), NavigationButtonList(), Spacer()],
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                  ],
                  Expanded(
                    flex: 9,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [...pages],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
