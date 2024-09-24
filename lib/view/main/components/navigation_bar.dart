import 'package:flutter/material.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import '../../intro/components/side_menu_button.dart';
import 'connect_button.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassMorphism(
        blur: 10,
        color: Colors.white,
        opacity: 0.2,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: MenuButton(
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: !Responsive.isLargeMobile(context)
                    ? Image.asset('assets/images/triange_icon.png')
                    : const SizedBox()),
            const Spacer(
              flex: 2,
            ),
            if (!Responsive.isLargeMobile(context))
              const NavigationButtonList(),
            const Spacer(
              flex: 2,
            ),
            const ConnectButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
