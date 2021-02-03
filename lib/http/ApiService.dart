import 'dart:convert' as convert;
import 'package:get_flutter/model/question.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static var client = http.Client();

  static fetchQuestion() async {
    var response = await client.get("https://opentdb.com/api.php?amount=10");
    if(response.statusCode == 200){
      var jsonString = response.body;
      return Question.fromJson(convert.jsonDecode(jsonString));
    }
  }

}