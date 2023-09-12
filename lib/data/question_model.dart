import 'dart:convert';

class QuestionModel {
  int responseCode;
  List<Result> results;

  QuestionModel({
    required this.responseCode,
    required this.results,
  });

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        responseCode: json["response_code"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };
}
