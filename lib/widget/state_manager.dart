import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateManagerPage extends StatelessWidget {
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text("Count value is : $count")),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            increment();
          },
          child: Text("add"),
        )
      ],
    );
  }
}
