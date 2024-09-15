import 'package:dartz/dartz.dart';
import 'package:falcon/core/core_exports.dart';

class CountVideoViewUsecase extends BaseUseCase<VideoViewEntity,CountVideoViewParameters>{

  final ContentsBaseRepo contentsBaseRepo ;

  CountVideoViewUsecase({required this.contentsBaseRepo});

  @override
  Future<Either<Failure, VideoViewEntity>> call(CountVideoViewParameters parameters) async{
    return contentsBaseRepo.countVideoView(parameters: parameters);
  }


}

class CountVideoViewParameters extends Equatable {

  final int studentId;
  final int videoId;

  CountVideoViewParameters({required this.studentId,required this.videoId});

  @override
  List<Object> get props => [studentId, videoId];
}