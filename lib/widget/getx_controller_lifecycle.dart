import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/lifecycle_controller.dart';

class GetXControllerLifecycle extends StatelessWidget {

  LifecycleController lifecycleController = Get.put(LifecycleController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LifecycleController>(
            initState: (data) => lifecycleController.add(),
            dispose: (_) => lifecycleController.cleanUpTask(),
            builder: (controller){
              return Text("The Lifecycle Value is ：${controller.count}");
            },
          ),
        ],
      ),
    );
  }
}
