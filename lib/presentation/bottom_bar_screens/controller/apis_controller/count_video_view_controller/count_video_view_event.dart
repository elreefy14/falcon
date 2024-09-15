part of 'count_video_view_bloc.dart';

@immutable
sealed class CountVideoViewEvent extends Equatable {}

class CountVideoViewRequestEvent extends CountVideoViewEvent {
  final int studentId;
  final int videoId;

  CountVideoViewRequestEvent({
    required this.studentId,
    required this.videoId,
  });

  @override
  List<Object> get props => [studentId, videoId];
}
