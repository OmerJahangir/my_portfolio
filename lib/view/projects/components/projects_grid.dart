import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/res/glass_widget.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'project_info.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return GetBuilder<ProjectController>(
          builder: (_) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(
                  vertical: defaultPadding, horizontal: defaultPadding),
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
                blur: controller.hovers[index] ? 0 : 20,
                color: Colors.black,
                opacity: 0.2,
                borderRadius: BorderRadius.circular(12),
                child: ProjectStack(index: index),
              ),
            );
          },
        );
      },
    );
  }
}
