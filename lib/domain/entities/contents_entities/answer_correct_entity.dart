import 'package:falcon/core/core_exports.dart';

class AnswerCorrectEntity extends Equatable {
  final int questionId;
  final int studentAnswer;
  final int correctAnswer;

  AnswerCorrectEntity({
    required this.questionId,
    required this.studentAnswer,
    required this.correctAnswer,
  });

  @override
  List<Object> get props => [questionId, studentAnswer, correctAnswer];
}
