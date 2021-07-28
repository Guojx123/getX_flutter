import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/model/my.dart';

class MyController extends GetxController {
  var my = My();

  void init(){
    my.name.value = "Gino";
  }

  void initById(){
    my.name.value = "Gino";
    update(['Unique ID']);
  }

  void convertToUpperCase() {
    my.name.value = my.name.value.toUpperCase();
  }

  void convertToLowerCase(){
    my.name.value = my.name.value.toLowerCase();
  }

  void addById(){
    my.name.value = "Gino By Unique ID";
    update(['Unique ID']);
  }
}
