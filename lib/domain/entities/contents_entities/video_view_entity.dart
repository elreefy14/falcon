import 'package:falcon/core/core_exports.dart';

class VideoViewEntity extends Equatable {
  final int id;
  final int viewCount;

  VideoViewEntity({
    required this.id,
    required this.viewCount,
  });

  @override
  List<Object> get props => [id, viewCount];
}
