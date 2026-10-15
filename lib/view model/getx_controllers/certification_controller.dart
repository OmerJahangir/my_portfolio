import 'package:get/get.dart';

import '../../model/certificate_model.dart';

class CertificationController extends GetxController {
  RxList<bool> hovers = List.filled(certificateList.length, false).obs;

  void onHover(int index, bool value) {
    hovers[index] = value;
  }
}
