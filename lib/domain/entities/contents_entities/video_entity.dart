import 'package:falcon/core/core_exports.dart';

class VideoEntity extends Equatable {
  final int id;
  final String video;

  VideoEntity({
    required this.id,
    required this.video,
  });

  @override
  List<Object> get props => [id, video];
}
