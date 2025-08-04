import 'package:flutter/material.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'project_link.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            projectList[index].name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Responsive.isMobile(context)
            ? const SizedBox(
                height: defaultPadding / 2,
              )
            : const SizedBox(
                height: defaultPadding,
              ),
        Text(
          projectList[index].description,
          style: TextStyle(
            color: Colors.white,
            height: 1.5,
            fontSize: size.width > 340 && size.width <= 380
                ? 10
                : size.width < 470
                    ? 14
                    : size.width <= 700
                        ? 15
                        : size.width < 1060
                            ? 16
                            : size.width >= 1024
                                ? 15
                                : size.width > 1400
                                    ? 18
                                    : 12,
          ),
          maxLines: size.width > 700 && size.width < 750
              ? 3
              : size.width > 340
                  ? 2
                  : size.width < 470
                      ? 3
                      : size.width > 600 && size.width < 900
                          ? 5
                          : size.width > 900 && size.width < 1400
                              ? 6
                              : 3,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        ProjectLinks(
          index: index,
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
      ],
    );
  }
}
