import 'package:falcon/core/core_exports.dart';

class VideoViewModel extends VideoViewEntity {
  VideoViewModel({
    required super.id,
    required super.viewCount,
  });

  factory VideoViewModel.fromJson(Map<String, dynamic> json) => VideoViewModel(
        id: json["id"],
        viewCount: json["viewCount"],
      );
}
