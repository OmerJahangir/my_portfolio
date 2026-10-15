import 'package:get/get.dart';

import '../../model/project_model.dart';

class ProjectController extends GetxController {
  RxList<bool> hovers = List.filled(projectList.length, false).obs;

  void onHover(int index, bool value) {
    hovers[index] = value;
  }
}
