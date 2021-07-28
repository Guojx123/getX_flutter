import 'package:get_flutter/http/ApiService.dart';
import 'package:get_flutter/model/question.dart';
import 'package:get_flutter/widget/ease_import.dart';
import 'package:get/get.dart';

class QuestionListController extends GetxController {
  var isLoading = true.obs;
  var questionList = List<Result>().obs;

  @override
  void onInit() {
    fetchQuestion();
    super.onInit();
  }

  void fetchQuestion() async {
    try {
      isLoading(true);
      Question questions = await ApiService.fetchQuestion();
      if(questions != null){
        questionList.assignAll(questions.results);
      }
    } finally {
      isLoading(false);
    }
  }
}
