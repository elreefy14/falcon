import 'package:falcon/core/core_exports.dart';

class CustomQuizItem extends StatelessWidget {
  const CustomQuizItem({
    super.key,
    required this.items,
  });

  final List<ContentEntity>? items ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: AppPadding.pHScreen4(context),
        vertical: AppPadding.pVScreen2(context),
      ),
      child: ListView.builder(
        itemCount: items?.length,
        padding: EdgeInsets.all(0),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: ()async{
              final prefs = await SharedPreferences.getInstance();
              int remainingTime = prefs.getInt('remainingTime') ?? 0; // Load saved time
              if (remainingTime > 0) {
                Navigator.push(context, PageTransition(
                  child: QuizBody(quizId: int.parse(items![index].id),),
                  type: PageTransitionType.fade,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: AppConstants.pageTransition200),
                ));
              }
              else{
                BlocProvider.of<TimerBloc>(context).add(StartTimer(120)); // Start timer if there is remaining time

              }
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(
                vertical: AppPadding.pVScreen08(context),
              ),
              child: Container(
                width: AppConstants.wScreen(context),
                height: AppConstants. hScreen(context)*0.125,
                decoration: BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius: BorderRadius.circular(AppRadius.r10,
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: AppPadding.pHScreen4(context),
                    vertical: AppPadding.pVScreen2(context),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        child: SizedBox(
                          height: AppConstants. hScreen(context)*0.08,
                          width: AppConstants.wScreen(context)*0.162,
                          child: Image.asset(
                            AssetsManager.quizIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: AppPadding.pHScreen2(context)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${items?[index].name}",
                            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
                          ),
                          SizedBox(height: AppPadding.pVScreen06(context)),
                          Row(
                            children: [
                              Icon(Icons.timer_outlined, size: AppSize.s14,color: ColorManager.darkGrey,),
                              SizedBox(width: AppPadding.pHScreen1(context),),
                              Text(
                                "${items?[index].timer} Second",
                                style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s9),
                              ),
                            ],
                          ),
                          SizedBox(height: AppPadding.pVScreen06(context)),
                          Row(
                            children: [
                              Icon(Icons.description_outlined, size:AppSize.s14,color: ColorManager.darkGrey,),
                              SizedBox(width: AppPadding.pHScreen1(context),),
                              Text(
                                "${items?[index].numberOfQuestions} questions",
                                style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s9),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Quiz 1",
                            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s10),
                          ),
                          SizedBox(height: AppPadding.pVScreen06(context)),
                          Text(
                            "Not Completed",
                            style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s9),
                          ),
                          SizedBox(height: AppPadding.pVScreen06(context)),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(
                                child: ModelAnswerScreen(),
                                type: PageTransitionType.fade,
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: AppConstants.pageTransition200),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.pHScreen2(context),
                                vertical: AppPadding.pVScreen04(context),
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.grey,
                                borderRadius: BorderRadius.circular(AppRadius.r4)
                              ),
                              child: Text(
                                "Answers",
                                style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s9),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}

