import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.blueGrey,
        onPressed: () {
          Get.snackbar(
              "Hi, guys",
              "This is a snackbar.",
              icon: Icon(Icons.messenger),
              snackPosition: SnackPosition.BOTTOM,
              backgroundGradient: LinearGradient(
                  colors: [Colors.tealAccent,Colors.blueAccent]
              )
          );
        },
        child: Text("click")
    );
  }
}
