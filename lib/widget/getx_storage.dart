import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStoragePage extends StatelessWidget {
  var emailEditingController = TextEditingController();
  var storage = GetStorage();


  @override
  Widget build(BuildContext context) {

    // var listen = storage.listen(() { });
    /// 修改时会触发监听
    storage.listenKey("email", (value) => print("value is $value"));

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailEditingController,
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("write"),
            onPressed: () {
              if (GetUtils.isEmail(emailEditingController.text)) {
                storage.write("email", emailEditingController.text);
              } else {
                Get.snackbar(
                  "Email",
                  "Your Email is Error!",
                  colorText: Colors.white,
                  backgroundColor: Colors.deepOrangeAccent,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
          ),
          RaisedButton(
            child: Text("read"),
            onPressed: () {
              print("The email is ${storage.read("email") ?? "null"}");
            },
          ),
        ],
      ),
    );
  }
}
