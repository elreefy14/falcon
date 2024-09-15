import 'dart:async';

import 'package:falcon/core/core_exports.dart';

part 'count_video_view_event.dart';
part 'count_video_view_state.dart';

class CountVideoViewBloc extends Bloc<CountVideoViewEvent, CountVideoViewState> {

  final CountVideoViewUsecase countVideoUsecase;
  CountVideoViewBloc({required this.countVideoUsecase}) : super(CountVideoViewState()) {
    on<CountVideoViewRequestEvent>(CountVideoViewRequest);
  }

  FutureOr<void> CountVideoViewRequest(CountVideoViewRequestEvent event, Emitter<CountVideoViewState> emit) async{
    final result =  await countVideoUsecase(CountVideoViewParameters(
      studentId: event.studentId,
      videoId: event.videoId,
    ));

    result.fold(
      (l)=>emit(CountVideoViewState(
        requestState: RequestState.error,
        responseMessage: l.message,
      )),

      (r)=>emit(CountVideoViewState(
        countVideoResponse: r,
        requestState: RequestState.done,
      )),

    );
  }
}
