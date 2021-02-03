import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/question_list_controller.dart';

class QuestionListView extends StatelessWidget {
  QuestionListController questionListController =
      Get.put(QuestionListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (questionListController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return ListView.builder(
              itemCount: questionListController.questionList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${questionListController.questionList[index].question}"),
                );
              });
      }),
    );
  }
}
