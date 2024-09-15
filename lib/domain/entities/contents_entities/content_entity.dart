import 'package:falcon/core/core_exports.dart';

class ContentEntity extends Equatable {
  final String id;
  final String name;
  final String? type;
  final String? timer;
  final String? numberOfQuestions;
  final String? enddate;


  ContentEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.timer,
    required this.numberOfQuestions,
    required this.enddate,
  });

  @override
  List<Object?> get props => [id, type, name,timer,numberOfQuestions,enddate];
}
