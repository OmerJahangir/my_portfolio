import 'package:flutter/material.dart';
import 'package:my_portfolio/view/5_packages/packages_view.dart';

import '../3_intro/introduction.dart';
import '../2_main/about.dart';
import '../2_main/main_view.dart';
import '../4_projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(
      pages: [
        const Introduction(),
        ProjectsView(),
        PackagesView(),
        // Certifications(),
        const AboutUs(),
      ],
    );
  }
}
