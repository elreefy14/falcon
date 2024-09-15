
import 'package:falcon/core/core_exports.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final List<QuestionEntity> questions;

  QuizBloc({required this.questions}) : super(QuizInitial()) {
    on<LoadQuiz>((event, emit) {
      // Initialize with the first question and no selected answers
      emit(QuizLoaded(0, List<String?>.filled(questions.length, null)));
    });

    on<NextQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        if (currentState.currentIndex < questions.length - 1) {
          emit(QuizLoaded(currentState.currentIndex + 1, currentState.selectedAnswers));
        }
      }
    });

    on<PreviousQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        if (currentState.currentIndex > 0) {
          emit(QuizLoaded(currentState.currentIndex - 1, currentState.selectedAnswers));
        }
      }
    });

    on<SelectAnswer>((event, emit) {
      if (state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        final updatedAnswers = List<String?>.from(currentState.selectedAnswers);
        updatedAnswers[event.questionIndex] = event.answer; // This line ensures only one answer is selected
        emit(QuizLoaded(currentState.currentIndex, updatedAnswers));
        List<AnswerSentEntity> questionsAnswer =[];


        bool canAdd=false;

        if (questionsAnswer.isEmpty){
          questionsAnswer.add(AnswerSentEntity(questionId: event.questionId, choiceNumber: event.answerIndex));
        }
        for(int i =0; i<questionsAnswer.length;i++){
          if(event.questionId.toString()==questionsAnswer[i].questionId.toString()){
            print(questionsAnswer[i].questionId);
            questionsAnswer[i] =AnswerSentEntity(questionId: event.questionId, choiceNumber: event.answerIndex);

          }
          else{
            canAdd = true;
          }
        }
        if(canAdd){
          questionsAnswer.add(AnswerSentEntity(questionId: event.questionId, choiceNumber: event.answerIndex));
        }

        print(event.questionId);
        print(event.answerIndex);
        print("------------------------");
        print(canAdd);
        print(questionsAnswer);

      }
    });

  }
}
