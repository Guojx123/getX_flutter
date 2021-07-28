import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.blueGrey,
        onPressed: () {
          Get.defaultDialog(
              title: "title",
              middleText: "This is Text.",
              backgroundColor: Colors.teal[200],
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child: Text("Data Loading..."))
                ],
              ),
              // cancel: Text("cancel"),
              // confirm: Text("confirm"),
              textCancel: "cancel",
              cancelTextColor: Colors.white,
              textConfirm: "confirm",
              confirmTextColor: Colors.white,
              onCancel: () {},
              onConfirm: () {});
        },
        child: Text("click"));
  }
}
