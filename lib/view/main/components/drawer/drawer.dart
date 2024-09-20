import 'package:flutter/material.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import '../../../../res/constants.dart';
import 'contact_icons.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';
import 'personal_info.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: GlassMorphism(
        blur: 10,
        color: Colors.white,
        opacity: 0.2,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(17), bottomRight: Radius.circular(17)),
        child: SingleChildScrollView(
          child: const Column(
            children: [
              About(),
              Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    MySKills(),
                    Knowledges(),
                    Divider(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    ContactIcon(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
