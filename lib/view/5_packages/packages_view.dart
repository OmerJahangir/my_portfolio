import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import '../../../view model/responsive.dart';
import 'components/packages_grid.dart';
import 'components/title_text.dart';

class PackagesView extends StatelessWidget {
  PackagesView({super.key});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: 'Latest', title: 'Packages'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: Responsive(
              desktop: PackagesGrid(
                crossAxisCount: 3,
              ),
              extraLargeScreen: PackagesGrid(
                crossAxisCount: 4,
              ),
              largeMobile: PackagesGrid(crossAxisCount: 1, ratio: 1.8),
              mobile: PackagesGrid(crossAxisCount: 1, ratio: 1.5),
              tablet: PackagesGrid(
                ratio: 1.4,
                crossAxisCount: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
