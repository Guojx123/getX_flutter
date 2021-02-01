import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetXService extends StatelessWidget {

  SharedPreferences prefs= await SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("data"),
          RaisedButton(
            child: Text("Increment"),
            onPressed: (){
              Get.find<Service>().incrementCounter();
            },
          )
        ],
      ),
    );
  }
}
