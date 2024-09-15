import 'package:falcon/core/core_exports.dart';

class AnswerCorrectModel extends AnswerCorrectEntity {
  AnswerCorrectModel({
    required super.questionId,
    required super.studentAnswer,
    required super.correctAnswer,
  });

  factory AnswerCorrectModel.fromJson(Map<String, dynamic> json) => AnswerCorrectModel(
        questionId: json["questionId"],
        studentAnswer: json["studentAnswer"],
        correctAnswer: json["correctAnswer"],
      );
}

