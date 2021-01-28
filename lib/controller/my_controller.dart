import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/model/my.dart';

class MyController extends GetxController {
  var my = My();

  init(){
    my.name.value = "Gino";
  }

  void convertToUpperCase() {
    my.name.value = my.name.value.toUpperCase();
  }

  void convertToLowerCase(){
    my.name.value = my.name.value.toLowerCase();
  }
}
