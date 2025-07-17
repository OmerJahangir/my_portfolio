import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/packages_model.dart';
import 'package:my_portfolio/view/5_packages/components/packages_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../res/constants.dart';
import '../../../../view model/getx_controllers/projects_controller.dart';

class PackagesStack extends StatelessWidget {
  final controller = Get.put(ProjectController());
  PackagesStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        // controller.onHover(index, value);
      },
      onTap: () {
        // ImageViewer(context, packageList[index].pubDevLink);

        launchUrl(Uri.parse(packageList[index].pubDevLink));
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: defaultPadding,
        ),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(30), color: bgColor),
        duration: const Duration(milliseconds: 500),
        child: PackagesDetail(
          index: index,
        ),
      ),
    );
  }
}
