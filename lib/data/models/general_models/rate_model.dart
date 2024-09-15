import 'package:falcon/core/core_exports.dart';

class RateModel extends RateEntity {
  RateModel({
    required super.studentId,
    required super.subjectId,
    required super.rateValue,
    required super.comment,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        studentId: json["studentId"],
        subjectId: json["subjectId"],
        rateValue: json["rateValue"],
        comment: json["comment"],
      );
}
