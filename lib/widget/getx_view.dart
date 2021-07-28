import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/count_controller.dart';

class GetPages extends StatelessWidget {

  CountController _controller = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetViewPage(),
        GetWidgetPage(),
        RaisedButton(
          onPressed: (){
            _controller.add();
          },
          child: Text("add"),
        )
      ],
    );
  }
}


class GetViewPage extends GetView<CountController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    return Container(
      child: Obx(() => Text(
        "GetView Count: ${controller.count}"
      )),
    );
  }
}

class GetWidgetPage extends GetWidget<CountController>{
  @override
  Widget build(BuildContext context) {
    Get.create(() => CountController());
    return Container(
      child: Obx(() => Text(
          "GetWidget Count: ${controller.count}"
      )),
    );
  }

}
