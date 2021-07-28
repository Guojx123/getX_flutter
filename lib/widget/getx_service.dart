import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/service/service.dart';
import 'package:get_flutter/util/shared_preferences.dart';

class GetXService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${PersistentStorage.get("count")}"),
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
