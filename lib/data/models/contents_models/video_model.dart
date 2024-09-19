import 'package:falcon/core/core_exports.dart';

class VideoFileModel extends VideoFileEntity {
  VideoFileModel({
    required super.id,
    required super.name,
    required super.iframe,
  });


  factory VideoFileModel.fromJson(Map<String, dynamic> json) => VideoFileModel(
        id: json["id"],
        name: json["name"],
        iframe: json["iframe"],
      );
}
