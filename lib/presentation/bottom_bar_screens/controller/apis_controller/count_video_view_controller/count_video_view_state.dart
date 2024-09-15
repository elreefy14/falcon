part of 'count_video_view_bloc.dart';

class CountVideoViewState extends Equatable {

  final VideoViewEntity? countVideoResponse;
  final RequestState requestState;
  final String responseMessage;

  CountVideoViewState({
    this.countVideoResponse,
    this.requestState = RequestState.loading,
    this.responseMessage = "",
  });

  @override
  List<Object?> get props => [
        countVideoResponse,
        requestState,
        responseMessage,
      ];
}
