import 'package:falcon/core/core_exports.dart';

class VideoFileEntity extends Equatable {
  final String id;
  final String name;
  final String iframe;

  VideoFileEntity({
    required this.id,
    required this.name,
    required this.iframe,
  });

  @override
  List<Object> get props => [id, name,iframe];
}
