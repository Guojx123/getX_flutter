import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/getx_worker_controller.dart';

class GetXWorkers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<GetXWorkersController>(
            init: GetXWorkersController(),
            builder: (controller) {
              return Text("${controller.num}");
            }),
        RaisedButton(
          onPressed: () {
            Get.find<GetXWorkersController>().add();
          },
          child: Text("How to Work ?"),
        )
      ],
    );
  }
}
