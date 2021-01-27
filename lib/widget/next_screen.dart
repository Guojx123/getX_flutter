import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Next Screen Page. \n "),
            Text("Receive Data is \n Channel: ${Get.parameters['channel']} \n Content: ${Get.parameters['content']}"),
          ],
        ),
      ),
    );
  }
}
