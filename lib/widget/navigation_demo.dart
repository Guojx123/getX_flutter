import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'unknown_route_page.dart';
import 'demo_home.dart';

class NavigationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              onPressed: () => {
                // Get.to(UnKnownRoutePage())
                Get.toNamed('/noPage')
              },
            child: Text("Go to No Found Page."),
          ),
          RaisedButton(
            onPressed: () => {
              Get.to(
                DemoHome(),
                arguments: "Data from Main Page",
                fullscreenDialog: true,
                transition: Transition.zoom,
                curve: Curves.bounceInOut,
              )
            },
            child: Text("Go to DemoHome and Send Data."),
          ),
          RaisedButton(
            onPressed: () async {
              var data = await Get.to(DemoHome());
              print("The Received Data is : $data");
            },
            child: Text("Go to DemoHome and Received Data."),
          ),
        ],
      ),
    );
  }
}
