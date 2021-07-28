import 'package:get/get.dart';

class GetXWorkersController extends GetxController{

  var num = 0.obs;

  void init(){

  }

  void add(){
    num++;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    
    ever(num, (_) => print(num));

    everAll([num], (_) => print(num));

    ever(num, (_) => print(num));

    debounce(num, (_) => print("用户停顿至少一秒没有操作"),time: Duration(seconds: 1));

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}