import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_game/data/question_model.dart';

var baseURL =
    "https://opentdb.com/api.php?amount=20&category=9&difficulty=easy&type=multiple";

Future<QuestionModel> fetchData() async {
  var response = await http.get(Uri.parse(baseURL));
  if (response.statusCode == 200) {
    return QuestionModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load Questions");
  }
}
