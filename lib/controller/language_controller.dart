import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_flutter/widget/ease_import.dart';

class LanguageController extends GetXController{
  void changeLanguage(var language,var country){
    var locale = Locale(language,country);
    Get.updateLocale(locale);
  }
}