import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Text(
              'Links',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            projectList[index].iosLink == ''
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(projectList[index].iosLink));
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/appstore_icon.svg',
                      height: 30,
                    ),
                  ),
            projectList[index].androidLink == ''
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(projectList[index].androidLink));
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/playstore_icon.svg',
                      height: 30,
                    ),
                  ),
            projectList[index].gitLink == ''
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(projectList[index].gitLink));
                    },
                    icon: Image.asset(
                      'assets/icons/dart.png',
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  )
          ],
        ),
        const Spacer(),
        // TextButton(
        //   onPressed: () {
        //     // launchUrl(Uri.parse(projectList[index].link));
        //   },
        //   child: const Text(
        //     'Read More>>',
        //     overflow: TextOverflow.ellipsis,
        //     style: TextStyle(
        //       color: Colors.amber,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 10,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
