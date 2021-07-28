import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SomeValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Some Value Page . \n "),
            Text("Receive Data is ${Get.parameters["value"]}."),
          ],
        ),
      ),
    );
  }
}
