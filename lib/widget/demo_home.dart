
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("这是DemoHome页面"),
            RaisedButton(
              onPressed: () => {
                // Get.to()
              },
              child: Text("Go to Next Page"),
            ),
            RaisedButton(
              onPressed: () => {
                Get.back(result: "It is from DemoHomeData")
              },
              child: Text("Back to Main and Send Data"),
            ),
            Text("${Get.arguments ?? ''}",style: TextStyle(
              color: Colors.indigoAccent
            ),)
          ],
        ),
      ),
    );
  }
}
