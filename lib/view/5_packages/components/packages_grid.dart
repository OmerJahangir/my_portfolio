import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/packages_model.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import '../../../../res/constants.dart';
import '../../../../view model/getx_controllers/projects_controller.dart';
import 'packages_info.dart';

class PackagesGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  PackagesGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: packageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: ratio,
      ),
      itemBuilder: (context, index) {
        return GetBuilder<ProjectController>(
          builder: (_) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(
                vertical: defaultPadding,
                horizontal: defaultPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // gradient: const LinearGradient(colors: [
                //   Colors.pinkAccent,
                //   Colors.blue,
                // ]),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.pink,
                //     offset: const Offset(-2, 0),
                //     blurRadius: controller.hovers[index] ? 20 : 13,
                //   ),
                //   BoxShadow(
                //     color: Colors.blue,
                //     offset: const Offset(2, 0),
                //     blurRadius: controller.hovers[index] ? 20 : 13,
                //   ),
                // ],
              ),
              child: GlassMorphism(
                // blur: controller.hovers[index] ? 0 : 16,
                blur: 16,
                color: Colors.black,
                child: PackagesStack(index: index),
              ),
            );
          },
        );
      },
    );
  }
}
