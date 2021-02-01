import 'package:get/get.dart';
import 'package:get_flutter/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service extends GetxService {
  Future<void> incrementCounter() async {
    int count = (await PersistentStorage().getStorage("count") ?? 0) + 1;
    print("Pressed $count times.");
    await PersistentStorage().setStorage("count", count);
  }

  Future<int> getValue() async {
    int count = await PersistentStorage().getStorage("count");
    return count;
  }
}
