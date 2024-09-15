import 'package:falcon/core/core_exports.dart';

class ContentModel extends ContentEntity {
  ContentModel({
    required super.id,
    required super.type,
    required super.name,
    required super.timer,
    required super.enddate,
    required super.numberOfQuestions,
  });

  factory ContentModel.fromJson(Map<String ,dynamic> json)=>ContentModel(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    timer: json["timer"],
    enddate: json["enddate"],
    numberOfQuestions: json["number_of_questions"],
  );
}
