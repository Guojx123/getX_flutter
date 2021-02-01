import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/service/service.dart';

class GetXService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
