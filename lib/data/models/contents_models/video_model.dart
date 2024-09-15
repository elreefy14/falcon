import 'package:falcon/core/core_exports.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required super.id,
    required super.video,
  });


  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        video: json["video"],
      );
}
