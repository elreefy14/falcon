
import 'package:falcon/core/core_exports.dart';

class QuizBody extends StatelessWidget {
  QuizBody({super.key,required this.quizId});

  final int quizId;

  //   final List<Map<String, dynamic>> questions = [
  //   {
  //     "question": "Which company developed the Dart programming language?",
  //     "options": [
  //       "A) Microsoft",
  //       "B) Google",
  //       "C) Apple",
  //       "D) Amazon"
  //     ]
  //   },
  //   {
  //     "question": "Which of the following is a state management approach in Flutter?",
  //     "options": [
  //       "A) BLoC (Business Logic Component)",
  //       "B) REST API",
  //       "C) SQL Database",
  //       "D) WebSocket"
  //     ]
  //   },
  //   {
  //     "question": "What does 'hot reload' in Flutter allow developers to do?",
  //     "options": [
  //       "A) Restart the app and clear all data.",
  //       "B) Update code and see changes instantly without losing the app state.",
  //       "C) Automatically update the app in the app store.",
  //       "D) Refresh the database connection."
  //     ]
  //   },
  //   {
  //     "question": "What is Flutter?",
  //     "options": [
  //       "A) A backend development framework.",
  //       "B) A toolkit for building user interfaces for iOS and Android using Dart.",
  //       "C) A cloud-based service for mobile applications.",
  //       "D) A version control system."
  //     ]
  //   },
  //   {
  //     "question": "Which file format is used to define Flutter UI layouts?",
  //     "options": [
  //       "A) JSON",
  //       "B) XML",
  //       "C) YAML",
  //       "D) Dart"
  //     ]
  //   },
  //   {
  //     "question": "What is the main entry point file for a Flutter app?",
  //     "options": [
  //       "A) app.xml",
  //       "B) main.dart",
  //       "C) index.html",
  //       "D) program.cs"
  //     ]
  //   },
  //   {
  //     "question": "Which widget in Flutter is used for creating a scrollable list?",
  //     "options": [
  //       "A) Container",
  //       "B) Column",
  //       "C) ListView",
  //       "D) GridView"
  //     ]
  //   },
  //   {
  //     "question": "What is the purpose of the `pubspec.yaml` file in a Flutter project?",
  //     "options": [
  //       "A) It is used to write application code.",
  //       "B) It contains metadata about the project, such as dependencies.",
  //       "C) It is used for version control.",
  //       "D) It stores user data."
  //     ]
  //   },
  //   {
  //     "question": "Which of the following is NOT a widget in Flutter?",
  //     "options": [
  //       "A) Text",
  //       "B) Button",
  //       "C) HTTPClient",
  //       "D) Image"
  //     ]
  //   },
  //   {
  //     "question": "What is the Dart programming language?",
  //     "options": [
  //       "A) A low-level programming language mainly used for system programming.",
  //       "B) A programming language optimized for building mobile, desktop, server, and web applications.",
  //       "C) A language used specifically for game development and graphics.",
  //       "D) A database query language similar to SQL."
  //     ]
  //   }
  // ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> GetQuestionsBloc(showQuestionsUsecase: sl<ShowQuestionsUsecase>())
        ..add(GetQuestionsRequestEvent(quizId: quizId)
        ),
      child: BlocBuilder<GetQuestionsBloc,GetQuestionsState>(
          builder: (context , questionsResponseState) {
          if(questionsResponseState.requestState == RequestState.loading){
            return Skeletonizer(
              child: _QuizBodyDetails(questions:[QuestionEntity(questionId: "", question:"---------------------------------", options: OptionModel(option1: "-----------", option2: "-----------", option3: "-----------", option4: "-----------"))],),
            );
          }else if (questionsResponseState.requestState == RequestState.done){
            return _QuizBodyDetails(questions:questionsResponseState.getQuestionsResponse!.questions ,);
          }else {
            return GestureDetector(
              onTap: (){
                context.read<GetQuestionsBloc>()..add(GetQuestionsRequestEvent(quizId:quizId));
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
                        questionsResponseState.responseMessage,
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

class _QuizBodyDetails extends StatelessWidget {
  _QuizBodyDetails({
    super.key,
    required this.questions
  });

  final List<QuestionEntity> questions;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(questions: questions)..add(LoadQuiz()),
      child: Scaffold(
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizLoaded) {
              return Column(
                children: [

                  // Pass the pageController safely to QuizInfo
                  QuizInfo(
                    quizState: state,
                    questions: questions,
                    pageController: _pageController,
                  ),

                  SizedBox(height: AppPadding.pHScreen8(context)),

                  // Pass the pageController safely to QuizPageView
                  QuizPageView(
                    quizState: state,
                    questions: questions,
                    pageController: _pageController,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.pHScreen4(context),
                      vertical: AppPadding.pVScreen1_5(context),
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withOpacity(0.06),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: ColorManager.grey.withOpacity(0.6),
                          width: 1.4,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            if (_pageController.hasClients) {
                              final currentPage = _pageController.page?.toInt() ?? 0;
                              if (currentPage > 0) {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: AppConstants.pageTransition200),
                                  curve: Curves.linearToEaseOut,
                                );
                              }
                            }
                          },
                          heightButton: AppConstants.hScreen(context) * 0.04,
                          widthButton: AppConstants.wScreen(context) * 0.24,
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.pHScreen4(context),
                          ),
                          backgroundColor: (_pageController.hasClients && _pageController.page != null && _pageController.page! < 0.5) ?
                          ColorManager.darkGrey.withOpacity(0.3) : ColorManager.primary,
                          elevation: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: ColorManager.white,
                                size: AppSize.s20,
                              ),
                              Text(
                                "Back",
                                style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s12),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                            if (_pageController.hasClients) {
                              final currentPage = _pageController.page?.toInt() ?? 0;
                              if (currentPage < (questions.length - 1)) { // Replace with the total number of questions
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: AppConstants.pageTransition200),
                                  curve: Curves.linearToEaseOut,
                                );
                              }
                            }
                          },
                          heightButton: AppConstants.hScreen(context) * 0.04,
                          widthButton: AppConstants.wScreen(context) * 0.24,
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.pHScreen4(context),
                          ),
                          elevation: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Next",
                                style: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s12),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorManager.white,
                                size: AppSize.s20,
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
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
