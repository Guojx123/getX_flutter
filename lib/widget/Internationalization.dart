import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/language_controller.dart';

class Internationalization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('hello'.tr,style: TextStyle(
          fontSize: 25,
          color: Colors.indigo
        ),),
        RaisedButton(
          child: Text("中文"),
            onPressed: (){
              LanguageController().changeLanguage("zh", "CN");
            }
        ),
        RaisedButton(
            child: Text("英文"),
            onPressed: (){
              LanguageController().changeLanguage("en", "US");
            }
        ),
      ],
    );
  }
}
