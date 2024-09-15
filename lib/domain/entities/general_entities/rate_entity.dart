import 'package:falcon/core/core_exports.dart';

class RateEntity extends Equatable {
  final int studentId;
  final int subjectId;
  final int rateValue;
  final String comment;

  RateEntity({
    required this.studentId,
    required this.subjectId,
    required this.rateValue,
    required this.comment,
  });

  @override
  List<Object> get props => [studentId, subjectId, rateValue, comment];
}
