import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/my_controller.dart';

class GetXUniqueID extends StatelessWidget {
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<MyController>(
            id: "Unique ID",
            builder: (controller) {
              return Text("My Name is : ${controller.my.name}");
            }),
        GetBuilder<MyController>(builder: (controller) {
          return Text("My Name is : ${controller.my.name}");
        }),
        RaisedButton(
          onPressed: () {
            myController.addById();
          },
          child: Text("通过唯一id改变"),
        ),
        RaisedButton(
          onPressed: () {
            myController.initById();
          },
          child: Text("init"),
        )
      ],
    );
  }
}
