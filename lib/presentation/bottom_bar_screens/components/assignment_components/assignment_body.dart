import 'package:falcon/core/core_exports.dart';

/*

class AssignmentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "flutter",
        elevation: 0,
        hasArrowBack: true,
        backgroundColor: ColorManager.primary.withOpacity(0.08),
        appBarHeight: AppConstants.hScreen(context) * 0.07,
      ),
      body: Column(
        children: [
          Container(
            width: AppConstants.wScreen(context),
            height: AppConstants.hScreen(context) * 0.14,
            decoration: BoxDecoration(
              color: ColorManager.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(
                AppRadius.r10,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pHScreen4(context),
                vertical: AppPadding.pVScreen2(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    child: SizedBox(
                      height: AppConstants.hScreen(context) * 0.1,
                      width: AppConstants.wScreen(context) * 0.2,
                      child: Image.asset(
                        AssetsManager.image_4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: AppPadding.pHScreen2(context)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assignment 1",
                        style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "Valid till 28-Mar-2024",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "12:00 AM",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "10 Marks - 10 Questions ",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Text(
                      //   "10 marks",
                      //   style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s10),
                      // ),
                      // SizedBox(height: AppPadding.pVScreen1(context)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.pHScreen2(context),
                          vertical: AppPadding.pVScreen1(context),
                        ),
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(AppRadius.r4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Submit",
                              style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s12).copyWith(
                                // decoration: TextDecoration.underline,
                                // decorationColor:ColorManager.primary,
                              ),

                            ),
                            SizedBox(
                              width: AppPadding.pHScreen4(context),
                            ),
                            Icon(Icons.send_rounded,color: ColorManager.white,size: AppSize.s20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pHScreen4(context),
                vertical: AppPadding.pVScreen2(context),
              ),
              child: BlocBuilder<AssignmentBloc, AssignmentState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.questions.length,
                    itemBuilder: (context, questionIndex) {
                      final question = state.questions[questionIndex];
                      final selectedAnswer = state.answers[questionIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Q (${questionIndex + 1}/${state.questions.length})",
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
                                        question.text,
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
                          // Wrap all RadioListTile widgets in a single Container
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppPadding.pVScreen2(context)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppPadding.pHScreen2(context),
                                  vertical: AppPadding.pVScreen06(context)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                                itemCount: question.options.length,
                                itemBuilder: (context, answerIndex) {
                                  final option = question.options[answerIndex];
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: AppPadding.pHScreen2(context),
                                      vertical: AppPadding.pVScreen06(context),
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        // BoxShadow(
                                        //   color: ColorManager.grey.withOpacity(0.3),
                                        //   offset: Offset(1.5, 3),
                                        //   spreadRadius: 1,
                                        //   blurRadius: 1,
                                        // ),
                                      ],
                                      borderRadius: BorderRadius.circular(AppRadius.r10),
                                      color: ColorManager.primaryWithOpacity06,
                                    ),
                                    child: Theme(
                                      data:  Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.grey,
                                      ),
                                      child: RadioListTile<int>(
                                        title: Text(
                                          option,
                                          style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                        ),
                                        value: answerIndex,
                                        groupValue: selectedAnswer,
                                        activeColor: ColorManager.primary,
                                        //fillColor: WidgetStateProperty.all(ColorManager.primary),
                                        onChanged: (value) {
                                          if (value != null) {
                                            context
                                                .read<AssignmentBloc>()
                                                .add(AnswerQuestion(
                                                questionIndex, value));
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/



class AssignmentBody extends StatelessWidget {
  AssignmentBody({required this.assignmentId});
  String assignmentId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> GetAssignmentBloc(showAssignmentsUsecase: sl<ShowAssignmentsUsecase>())
        ..add(GetAssignmentRequestEvent(assignmentId: int.parse("$assignmentId"))
        ),
      child: BlocBuilder<GetAssignmentBloc,GetAssignmentState>(
          builder: (context , assignmentsResponseState) {
            if(assignmentsResponseState.requestState == RequestState.loading){
              return Skeletonizer(
                child: _AssignmentBodyDetails(assignment:AssignmentEntity(subjectName: "subjectName", homeworkName: "homeworkName", questions: [QuestionEntity(questionId: "", question:"---------------------------------", options: OptionModel(option1: "-----------", option2: "-----------", option3: "-----------", option4: "-----------"))]),),
              );
            }
            else if (assignmentsResponseState.requestState == RequestState.done){
              return _AssignmentBodyDetails(assignment:assignmentsResponseState.getAssignmentResponse,);
            }
            else {
              return GestureDetector(
                onTap: (){
                  context.read<GetAssignmentBloc>()..add(GetAssignmentRequestEvent(assignmentId: int.parse("$assignmentId")));
                },
                child: Scaffold(
                  body: Container(
                    width: AppConstants.wScreen(context),
                    height: AppConstants.hScreen(context),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppPadding.pHScreen4(context),
                      vertical: AppPadding.pVScreen6(context),
                    ),
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
                          assignmentsResponseState.responseMessage,
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
                ),
              );
            }
          }
      ),
    );
  }


}

class _AssignmentBodyDetails extends StatelessWidget {
  const _AssignmentBodyDetails({
    super.key,
    required this.assignment,
  });


  final AssignmentEntity? assignment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "${assignment?.homeworkName}",
        elevation: 0,
        hasArrowBack: true,
        backgroundColor: ColorManager.primary.withOpacity(0.08),
        appBarHeight: AppConstants.hScreen(context) * 0.07,
      ),
      body: Column(
        children: [
          Container(
            width: AppConstants.wScreen(context),
            height: AppConstants.hScreen(context) * 0.16,
            decoration: BoxDecoration(
              color: ColorManager.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(
                AppRadius.r10,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pHScreen4(context),
                vertical: AppPadding.pVScreen2(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    child: SizedBox(
                      height: AppConstants.hScreen(context) * 0.1,
                      width: AppConstants.wScreen(context) * 0.2,
                      child: Image.asset(
                        AssetsManager.image_4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: AppPadding.pHScreen2(context)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assignment 1",
                        style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "Valid till 28-Mar-2024",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "12:00 AM",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                      SizedBox(height: AppPadding.pVScreen06(context)),
                      Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            size: AppSize.s14,
                            color: ColorManager.darkGrey,
                          ),
                          SizedBox(
                            width: AppPadding.pHScreen1(context),
                          ),
                          Text(
                            "${assignment!.questions.length} Questions ",
                            style: getBoldStyle(
                                color: ColorManager.textGrey,
                                fontSize: FontSize.s9),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Text(
                      //   "10 marks",
                      //   style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s10),
                      // ),
                      // SizedBox(height: AppPadding.pVScreen1(context)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.pHScreen2(context),
                          vertical: AppPadding.pVScreen1(context),
                        ),
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(AppRadius.r4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Submit",
                              style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s12).copyWith(
                                // decoration: TextDecoration.underline,
                                // decorationColor:ColorManager.primary,
                              ),

                            ),
                            SizedBox(
                              width: AppPadding.pHScreen4(context),
                            ),
                            Icon(Icons.send_rounded,color: ColorManager.white,size: AppSize.s20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pHScreen4(context),
                vertical: AppPadding.pVScreen2(context),
              ),
              child: ListView.builder(
                itemCount: assignment!.questions.length,
                itemBuilder: (context, questionIndex) {

                  final question = assignment!.questions[questionIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Q (${questionIndex + 1}/${assignment!.questions.length})",
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
                                    question.question,
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
                      // Wrap all RadioListTile widgets in a single Container
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppPadding.pVScreen2(context)),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppPadding.pHScreen2(context),
                              vertical: AppPadding.pVScreen06(context)),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppPadding.pHScreen2(context),
                                  vertical: AppPadding.pVScreen06(context),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: ColorManager.grey.withOpacity(0.3),
                                    //   offset: Offset(1.5, 3),
                                    //   spreadRadius: 1,
                                    //   blurRadius: 1,
                                    // ),
                                  ],
                                  borderRadius: BorderRadius.circular(AppRadius.r10),
                                  color: ColorManager.primaryWithOpacity06,
                                ),
                                child: Theme(
                                  data:  Theme.of(context).copyWith(
                                    unselectedWidgetColor: Colors.grey,
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text(
                                      question.options.option1,
                                      style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                    ),
                                    value: 0,
                                    groupValue: 1,
                                    activeColor: ColorManager.primary,
                                    //fillColor: WidgetStateProperty.all(ColorManager.primary),
                                    onChanged: (value) {
                                      if (value != null) {
                                        context
                                            .read<AssignmentBloc>()
                                            .add(AnswerQuestion(
                                            questionIndex, value));
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppPadding.pHScreen2(context),
                                  vertical: AppPadding.pVScreen06(context),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: ColorManager.grey.withOpacity(0.3),
                                    //   offset: Offset(1.5, 3),
                                    //   spreadRadius: 1,
                                    //   blurRadius: 1,
                                    // ),
                                  ],
                                  borderRadius: BorderRadius.circular(AppRadius.r10),
                                  color: ColorManager.primaryWithOpacity06,
                                ),
                                child: Theme(
                                  data:  Theme.of(context).copyWith(
                                    unselectedWidgetColor: Colors.grey,
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text(
                                      question.options.option2,
                                      style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                    ),
                                    value: 0,
                                    groupValue: 1,
                                    activeColor: ColorManager.primary,
                                    //fillColor: WidgetStateProperty.all(ColorManager.primary),
                                    onChanged: (value) {
                                      if (value != null) {
                                        context
                                            .read<AssignmentBloc>()
                                            .add(AnswerQuestion(
                                            questionIndex, value));
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppPadding.pHScreen2(context),
                                  vertical: AppPadding.pVScreen06(context),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: ColorManager.grey.withOpacity(0.3),
                                    //   offset: Offset(1.5, 3),
                                    //   spreadRadius: 1,
                                    //   blurRadius: 1,
                                    // ),
                                  ],
                                  borderRadius: BorderRadius.circular(AppRadius.r10),
                                  color: ColorManager.primaryWithOpacity06,
                                ),
                                child: Theme(
                                  data:  Theme.of(context).copyWith(
                                    unselectedWidgetColor: Colors.grey,
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text(
                                      question.options.option3,
                                      style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                    ),
                                    value: 0,
                                    groupValue: 1,
                                    activeColor: ColorManager.primary,
                                    //fillColor: WidgetStateProperty.all(ColorManager.primary),
                                    onChanged: (value) {
                                      if (value != null) {
                                        context
                                            .read<AssignmentBloc>()
                                            .add(AnswerQuestion(
                                            questionIndex, value));
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppPadding.pHScreen2(context),
                                  vertical: AppPadding.pVScreen06(context),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: ColorManager.grey.withOpacity(0.3),
                                    //   offset: Offset(1.5, 3),
                                    //   spreadRadius: 1,
                                    //   blurRadius: 1,
                                    // ),
                                  ],
                                  borderRadius: BorderRadius.circular(AppRadius.r10),
                                  color: ColorManager.primaryWithOpacity06,
                                ),
                                child: Theme(
                                  data:  Theme.of(context).copyWith(
                                    unselectedWidgetColor: Colors.grey,
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text(
                                      question.options.option4,
                                      style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
                                    ),
                                    value: 0,
                                    groupValue: 1,
                                    activeColor: ColorManager.primary,
                                    //fillColor: WidgetStateProperty.all(ColorManager.primary),
                                    onChanged: (value) {
                                      if (value != null) {
                                        context
                                            .read<AssignmentBloc>()
                                            .add(AnswerQuestion(
                                            questionIndex, value));
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              // child: BlocBuilder<AssignmentBloc, AssignmentState>(
              //   builder: (context, state) {
              //     return ListView.builder(
              //       itemCount: state.questions.length,
              //       itemBuilder: (context, questionIndex) {
              //         final question = state.questions[questionIndex];
              //         final selectedAnswer = state.answers[questionIndex];
              //         return Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               width: AppConstants.wScreen(context),
              //               height: AppConstants.hScreen(context) * 0.16,
              //               padding: EdgeInsets.symmetric(
              //                 horizontal: AppPadding.pHScreen4(context),
              //                 vertical: AppPadding.pVScreen2(context),
              //               ),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(AppRadius.r10),
              //                 color: ColorManager.lightGrey,
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         "Q (${questionIndex + 1}/${state.questions.length})",
              //                         textAlign: TextAlign.center,
              //                         style: getBoldStyle(color: ColorManager.textGrey.withOpacity(0.6), fontSize: FontSize.s10),
              //                       ),
              //                       Text(
              //                         "1 Mark",
              //                         textAlign: TextAlign.center,
              //                         style: getBoldStyle(color: ColorManager.textGrey.withOpacity(0.6), fontSize: FontSize.s10),
              //                       ),
              //                     ],
              //                   ),
              //                   Spacer(),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Flexible(
              //                         child: Text(
              //                           question.text,
              //                           textAlign: TextAlign.center,
              //                           style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Spacer(),
              //                 ],
              //               ),
              //             ),
              //             // Wrap all RadioListTile widgets in a single Container
              //             Padding(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: AppPadding.pVScreen2(context)),
              //               child: Container(
              //                 margin: EdgeInsets.symmetric(
              //                     horizontal: AppPadding.pHScreen2(context),
              //                     vertical: AppPadding.pVScreen06(context)),
              //                 child: ListView.builder(
              //                   shrinkWrap: true,
              //                   physics: NeverScrollableScrollPhysics(), // Prevent scrolling
              //                   itemCount: question.options.length,
              //                   itemBuilder: (context, answerIndex) {
              //                     final option = question.options[answerIndex];
              //                     return Container(
              //                       margin: EdgeInsets.symmetric(
              //                         horizontal: AppPadding.pHScreen2(context),
              //                         vertical: AppPadding.pVScreen06(context),
              //                       ),
              //                       decoration: BoxDecoration(
              //                         boxShadow: [
              //                           // BoxShadow(
              //                           //   color: ColorManager.grey.withOpacity(0.3),
              //                           //   offset: Offset(1.5, 3),
              //                           //   spreadRadius: 1,
              //                           //   blurRadius: 1,
              //                           // ),
              //                         ],
              //                         borderRadius: BorderRadius.circular(AppRadius.r10),
              //                         color: ColorManager.primaryWithOpacity06,
              //                       ),
              //                       child: Theme(
              //                         data:  Theme.of(context).copyWith(
              //                           unselectedWidgetColor: Colors.grey,
              //                         ),
              //                         child: RadioListTile<int>(
              //                           title: Text(
              //                             option,
              //                             style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
              //                           ),
              //                           value: answerIndex,
              //                           groupValue: selectedAnswer,
              //                           activeColor: ColorManager.primary,
              //                           //fillColor: WidgetStateProperty.all(ColorManager.primary),
              //                           onChanged: (value) {
              //                             if (value != null) {
              //                               context
              //                                   .read<AssignmentBloc>()
              //                                   .add(AnswerQuestion(
              //                                   questionIndex, value));
              //                             }
              //                           },
              //                         ),
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
