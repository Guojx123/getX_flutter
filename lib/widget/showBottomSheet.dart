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
          );
        },
        child: Text("click"));
  }
}
