import 'package:falcon/core/core_exports.dart';

class ModelAnswerScreen extends StatelessWidget {
  const ModelAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "Task Answers",
        hasArrowBack: true,
        elevation: 0,
        backgroundColor: ColorManager.primary.withOpacity(0.06),
        appBarHeight: AppConstants.hScreen(context)*0.09,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.pHScreen4(context),
              vertical: AppPadding.pVScreen2(context),
            ),
            decoration: BoxDecoration(
              color: ColorManager.primary.withOpacity(0.06),
              border: Border.symmetric(horizontal: BorderSide(color: ColorManager.grey.withOpacity(0.6),width: 1.4)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                  child: SizedBox(
                    height: AppConstants.hScreen(context)*0.11,
                    width: AppConstants.wScreen(context)*0.27,
                    child: Image.asset(
                      AssetsManager.image_4,
                      fit:BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppConstants.wScreen(context)*0.03,
                ),
                SizedBox(
                  width: AppConstants.wScreen(context)*0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task1 Answers",
                        style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppPadding.pVScreen1(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chapter 1",
                                  style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s10),
                                ),
                                Text(
                                  "Quiz 1",
                                  style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s10),
                                ),
                                Text(
                                  "50 Marks",
                                  style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s10),
                                ),
                              ],
                            ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppConstants.hScreen(context)*0.04,),
          Container(
            padding:  EdgeInsets.symmetric(horizontal:  AppPadding.pHScreen4(context)),
            height: AppConstants.hScreen(context)*0.64,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context,index) {
                return Column(
                  children: [
                    Container(
                      width: AppConstants.wScreen(context),
                      height: AppConstants.hScreen(context) * 0.16,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.pHScreen4(context),
                        vertical: AppPadding.pVScreen2(context),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r10),
                        color: ColorManager.lightGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Q (${index + 1}/${2})",
                                textAlign: TextAlign.center,
                                style: getBoldStyle(color: ColorManager.textGrey.withOpacity(0.6), fontSize: FontSize.s10),
                              ),
                              Text(
                                "1 Mark",
                                textAlign: TextAlign.center,
                                style: getBoldStyle(color: ColorManager.textGrey.withOpacity(0.6), fontSize: FontSize.s10),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Question ${index+1}",
                                  textAlign: TextAlign.center,
                                  style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.hScreen(context) * 0.03,
                    ),
                    SizedBox(
                      height: AppConstants.hScreen(context) * 0.2,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.pHScreen4(context),
                              vertical: AppPadding.pVScreen1_5(context),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: AppPadding.pVScreen08(context),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color:ColorManager.lightGrey.withOpacity(0.8), ),
                              borderRadius: BorderRadius.circular(AppRadius.r10),
                              color:ColorManager.primaryWithOpacity06,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: ColorManager.grey.withOpacity(0.6),
                              //     offset: Offset(1.5, 2),
                              //     spreadRadius: 1,
                              //     blurRadius: 1,
                              //   ),
                              // ],

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "your Answer is : Option 1",
                                    style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s10),
                                  ),
                                ),
                                Icon(Icons.check, color: ColorManager.primary, size: AppSize.s24),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.pHScreen4(context),
                              vertical: AppPadding.pVScreen1_5(context),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: AppPadding.pVScreen08(context),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color:ColorManager.lightGrey.withOpacity(0.8), ),
                              borderRadius: BorderRadius.circular(AppRadius.r10),
                              color:ColorManager.primaryWithOpacity06,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: ColorManager.grey.withOpacity(0.6),
                              //     offset: Offset(1.5, 2),
                              //     spreadRadius: 1,
                              //     blurRadius: 1,
                              //   ),
                              // ],

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Correct Answer is : Option 1",
                                    style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s10),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
