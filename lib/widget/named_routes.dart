import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamedRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Go to NextScreen by Name"),
            onPressed: () => {
              Get.toNamed("/nextScreen")
            },
          ),
          RaisedButton(
            child: Text("Go to NextScreen by Name and Send Data"),
            onPressed: () => {
              Get.toNamed("/nextScreen?channel=Gip Code&content=GetX With Flutter.")
            },
          ),
          RaisedButton(
            child: Text("Go to someValuePage by Name and Optional Value"),
            onPressed: () => {
              Get.toNamed("/someValue/1234")
            },
          ),
        ],
      ),
    );
  }
}
