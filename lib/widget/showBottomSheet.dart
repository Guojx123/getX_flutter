import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.white,
        onPressed: () {
          Get.bottomSheet(
              Container(
                child: Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text('Light Theme'),
                      onTap: () => {
                        Get.changeTheme(ThemeData.light()),
                        Get.back()
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Dark Theme'),
                      onTap: () => {
                        Get.changeTheme(ThemeData.dark()),
                        Get.back()
                      },
                    ),
                  ],
                ),
              ),
            barrierColor: Colors.black.withOpacity(0.4),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 2.0,
              ),
            ),
            enableDrag: true,
          );
        },
        child: Text("click"));
  }
}
