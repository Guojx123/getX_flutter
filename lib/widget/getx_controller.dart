import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/my_controller.dart';
import 'package:get_flutter/controller/my_information_controller.dart';

class GetXController extends StatelessWidget {
  
  MyController myController = Get.put(MyController());
  MyInformationController myInformationController = Get.put(MyInformationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text("My Name is : ${myController.my.name}")),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            myController.convertToUpperCase();
          },
          child: Text("toUpper"),
        ),
        RaisedButton(
          onPressed: () {
            myController.convertToLowerCase();
          },
          child: Text("toLower"),
        ),
        RaisedButton(
          onPressed: () {
            myController.init();
          },
          child: Text("init"),
        ),
        Text("Make the whole class observabl"),
        Obx(() => Text("My Height Information is : ${myInformationController.myInformation.value.height}")),
        RaisedButton(
          onPressed: () {
            myInformationController.convertToUpperCase();
          },
          child: Text("长高1cm"),
        ),
        RaisedButton(
          onPressed: () {
            myInformationController.init();
          },
          child: Text("初始化"),
        ),
      ],
    );
  }
}
