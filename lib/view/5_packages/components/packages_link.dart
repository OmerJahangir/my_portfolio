import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackagesLinks extends StatelessWidget {
  final int index;
  const PackagesLinks({super.key, required this.index});
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
            IconButton(
              onPressed: () {
                // launchUrl(Uri.parse(packageList[index].pubDevLink));
              },
              icon: Image.asset(
                'assets/icons/dart.png',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              // SvgPicture.asset(
              //   'assets/icons/dart.svg',
              //   height: 30,
              // ),
            ),
            IconButton(
              onPressed: () {
                // launchUrl(Uri.parse(projectList[index].androidLink));
              },
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                height: 30,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // launchUrl(Uri.parse(projectList[index].link));
          },
          child: const Text(
            'Read More>>',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        )
      ],
    );
  }
}
