import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/my_controller.dart';
import 'package:get_flutter/controller/my_information_controller.dart';

class GetXControllerType extends StatelessWidget {

  MyController myController = Get.put(MyController());
  MyInformationController myInformationController = Get.put(MyInformationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Make the whole class observabl"),
        GetX<MyInformationController>(
          init: MyInformationController(),
          builder: (controller){
            return Text(
              "The Value is ${controller.myInformation.value.height}"
            );
          },
        ),
        Obx(() => Text("My Height Information is : ${myInformationController.myInformation.value.height}")),
        RaisedButton(
          onPressed: () {
            // myInformationController.convertToUpperCase();
            Get.find<MyInformationController>().convertToUpperCase();
          },
          child: Text("长高1cm"),
        ),
        RaisedButton(
          onPressed: () {
            myInformationController.init();
            // Get.find<MyInformationController>().init();
          },
          child: Text("初始化"),
        ),
      ],
    );
  }
}
