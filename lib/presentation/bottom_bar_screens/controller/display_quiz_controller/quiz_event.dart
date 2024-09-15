part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class LoadQuiz extends QuizEvent {}

class NextQuestion extends QuizEvent {}

class PreviousQuestion extends QuizEvent {}

class SelectAnswer extends QuizEvent {
  final int questionIndex;
  final String answer;
  final String questionId;
  final String answerIndex;

  const SelectAnswer({
    required this.questionIndex,
    required this.answer,
    required this.questionId,
    required this.answerIndex,
  });

  @override
  List<Object?> get props => [questionIndex, answer, questionId, answerIndex];
}
