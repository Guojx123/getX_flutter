import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/model/my_infomation.dart';

class MyInformationController extends GetxController{

  /// Make the whole class observable
  /// 使整个Class都可观察

  var myInformation = MyInformation(height: 175,weight: 23).obs;

  init(){
    myInformation.update((myInformation) {
      myInformation.height = 175;
    });
  }

  void convertToUpperCase(){
    myInformation.update((myInformation) {
      myInformation.height = myInformation.height + 1;
    });
  }
}