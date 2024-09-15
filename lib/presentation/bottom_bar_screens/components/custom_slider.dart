import 'package:falcon/core/core_exports.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart' as cSlider;


class CustomAdsSlider extends StatefulWidget {
  @override
  State<CustomAdsSlider> createState() => _CustomAdsSliderState();
}

class _CustomAdsSliderState extends State<CustomAdsSlider> {


  String extractYoutubeId(String url) {
    final RegExp regExp = RegExp(
      r'(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
      multiLine: false,
    );

    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!; // Return the matched video ID
    } else {
      throw 'Invalid YouTube URL';
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHomeDataBloc,GetHomeDataState>(
        buildWhen: (previous, current) =>
        previous.getAdsRequestState != current.getAdsRequestState,
      builder: (context,adsResponseState) {
        if(adsResponseState.getAdsRequestState ==RequestState.loading){
          return Skeletonizer(
            child:Container(
              width: double.infinity,
              height: AppConstants.hScreen(context)*0.22,
              margin: EdgeInsets.symmetric(horizontal: AppPadding.pHScreen4(context)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              ),
              child: Image.asset(
                AssetsManager.warningImage,
                fit: BoxFit.fill,
              ),
            ),
          );
        }
        else if(adsResponseState.getAdsRequestState ==RequestState.done ){
          return SizedBox(
            width: double.infinity,
            child: cSlider.CarouselSlider.builder(
              itemCount: adsResponseState.adsResponse.length,
              itemBuilder: (context, index, realIndex) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppConstants.hScreen(context)*0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.r8),
                            child:  YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: extractYoutubeId(adsResponseState.adsResponse[index].video), // YouTube video ID
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amberAccent,
                              ),
                            ),

                            /*child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AssetsManager.image_1,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "${adsResponseState.adsResponse[index].video}",
                                  style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s4),
                                ),
                              ],
                            ),*/
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: AppConstants.hScreen(context)*0.22,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(
                                child: VideoPlayerScreen(link:adsResponseState.adsResponse[index].video,),
                                type: PageTransitionType.fade,
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: AppConstants.pageTransition200),
                              ));
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              options: cSlider.CarouselOptions(
                height: AppConstants.hScreen(context)*0.22,
                aspectRatio: 16 / 9,
                viewportFraction: 0.91,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 2500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        }
        else{
          return GestureDetector(
            onTap: (){
              context.read<GetHomeDataBloc>().add(GetAdsEvent());
            },
            child: Container(
              width: double.infinity,
              height: AppConstants.hScreen(context)*0.22,
              margin: EdgeInsets.symmetric(horizontal: AppPadding.pHScreen4(context)),
              decoration: BoxDecoration(
                color: ColorManager.lightGrey,
                borderRadius: BorderRadius.circular(AppRadius.r8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsManager.warningImage,
                    height: AppConstants.hScreen(context)*0.05,
                    color: ColorManager.darkGrey.withOpacity(0.6),
                  ),
                  SizedBox(height: AppPadding.pVScreen1(context),),
                  Text(
                    adsResponseState.getAdsMessage,
                    style: getMediumStyle(color: ColorManager.darkGrey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppPadding.pVScreen1(context),),
                  Icon(
                    Icons.refresh,
                    color: ColorManager.darkGrey,
                    size: AppSize.s20,

                  ),

                ],
              ),
            ),
          );

        }
      }
    );
  }
}