import 'package:get/get.dart';

class LifecycleController extends GetxController {
  var count = 0;

  void add() {
    Future.delayed(Duration(seconds: 2000));
    count++;
    update();
  }

  void cleanUpTask() {
    print("Clean up task");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Get.snackbar("Init Called", "");
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
