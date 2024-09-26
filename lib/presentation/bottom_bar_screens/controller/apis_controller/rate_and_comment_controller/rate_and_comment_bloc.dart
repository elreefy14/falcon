
import 'dart:async';

import 'package:falcon/core/core_exports.dart';


part 'rate_and_comment_event.dart';
part 'rate_and_comment_state.dart';

class RateAndCommentBloc extends Bloc<RateAndCommentEvent, RateAndCommentState> {

  final RateAndCommentUsecase rateAndCommentUsecase;

  RateAndCommentBloc({required this.rateAndCommentUsecase})
      : super(RateAndCommentState()) {
    on<RateAndCommentRequestEvent>(_RateAndCommentRequest);
  }


  FutureOr<void> _RateAndCommentRequest(RateAndCommentRequestEvent event,
      Emitter<RateAndCommentState> emit) async {
    emit(RateAndCommentLoadingState());

    final result = await rateAndCommentUsecase(RateAndCommentParameters(
      studentId: event.studentId,
      subjectId: event.subjectId,
      rate: event.ratingValue,
      comment: event.comment,
    ));

    emit(RateAndCommentState());



    print("studentId: ${event.studentId}");
    print("subjectId: ${event.subjectId}");
    print("ratingValue: ${event.ratingValue}");
    print("comment: ${event.comment}");
    print("rate result : $result");

    result.fold(
          (l) => emit(RateAndCommentState(
            requestState: RequestState.error,
            responseMessage: l.message,
          )),

          (r) => emit(RateAndCommentState(
            ratingResponse: r,
            requestState: RequestState.done,
          )),
    );
  }
}
