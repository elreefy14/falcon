import 'package:falcon/core/core_exports.dart';

class ChaptersContentViews extends StatefulWidget {
  const ChaptersContentViews({
    super.key,
    required this.title,
    required this.chapterId,
    required this.chapterImage,

  });

  final String title;
  final int chapterId;
  final String chapterImage;
  @override
  State<ChaptersContentViews> createState() => _ChaptersContentViewsState();
}

class _ChaptersContentViewsState extends State<ChaptersContentViews> with SingleTickerProviderStateMixin{

  late TabController _contentTabController;

  @override
  void initState() {
    super.initState();
    _contentTabController = TabController(length: 5, vsync: this);
    _contentTabController.addListener(_handleContentTabSelection);
  }

  void _handleContentTabSelection() {
    if (_contentTabController.indexIsChanging) {
      BlocProvider.of<ContentTabBloc>(context).add(ContentTabChanged(_contentTabController.index));
    }
  }

  @override
  void dispose() {
    _contentTabController.removeListener(_handleContentTabSelection);
    _contentTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: '',
        hasCenterWidget: true,
        centerWidget: Padding(
          padding:  EdgeInsets.only(
            top: AppConstants.hScreen(context)*0.03,
          ),
          child: Text(
            widget.title,
            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),
          ),
        ),
        hasArrowBack: true,
        appBarHeight: AppConstants.hScreen(context)*0.14,
        bottom: TabBar(
          controller: _contentTabController,
          dividerColor: ColorManager.grey,
          unselectedLabelColor:ColorManager.textGrey,
          overlayColor: WidgetStateProperty.all(ColorManager.white),
          isScrollable: false,
          labelPadding: EdgeInsets.only(left: 0, right: 0),
          labelStyle: getBoldStyle(color: ColorManager.primary,fontSize: 12),
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Files'),
            Tab(text: 'Videos'),
            Tab(text: 'Tasks'),
            Tab(text: 'Quizzes'),
          ],
        ),
      ),
      body: BlocBuilder<ContentTabBloc, ContentTabState>(
        builder: (context, state) {
          _contentTabController.index = state.selectedIndex;
          return BlocProvider(
            create: (BuildContext context)=> GetAllContentsBloc(showAllContentsUsecase: sl<ShowAllContentsUsecase>(), showOrgContentsUsecase: sl<ShowOrgContentsUsecase>())
              ..add(GetAllContentsRequestEvent(chapterId: widget.chapterId,userId: int.parse(context.read<CurrentUserBloc>().userData!.id)))
              ..add(GetOrgContentsRequestEvent(chapterId: widget.chapterId,userId: int.parse(context.read<CurrentUserBloc>().userData!.id))
              ),
            child: BlocBuilder<GetAllContentsBloc,GetAllContentsState>(
                builder: (context , allContentResponseState) {
                return BlocBuilder<GetAllContentsBloc,GetAllContentsState>(
                    builder: (context , orgContentResponseState) {
                    if(orgContentResponseState.allContentsRequestState ==RequestState.loading || orgContentResponseState.orgContentsRequestState ==RequestState.loading ){
                      return Skeletonizer(
                        child: TabBarView(
                          controller: _contentTabController,
                          children: [
                            AllContentItem(chapterId: widget.chapterId.toString(),chapterImage: widget.chapterImage,items: [ ContentEntity(id: "", type: "", name: "-----------------",timer:"-----",enddate: "--------",numberOfQuestions: "--")],),
                            OrgContentItem(chapterId:widget.chapterId.toString(),contentType: FileType.file,chapterImage: widget.chapterImage,items: [ ContentEntity(id: "", type: "", name: "-----------------",timer:"-----",enddate: "--------",numberOfQuestions: "--" )],),
                            OrgContentItem(chapterId:widget.chapterId.toString(),contentType: FileType.video,chapterImage: widget.chapterImage,items: [ ContentEntity(id: "", type: "", name: "-----------------",timer:"-----",enddate: "--------",numberOfQuestions: "--")]),
                            OrgContentItem(chapterId:widget.chapterId.toString(),contentType: FileType.task,chapterImage: widget.chapterImage,items: [ ContentEntity(id: "", type: "", name: "-----------------",timer:"-----",enddate: "--------",numberOfQuestions: "--")]),
                            OrgContentItem(chapterId:widget.chapterId.toString(),contentType: FileType.quiz,chapterImage: widget.chapterImage,items: [ ContentEntity(id: "", type: "", name: "-----------------",timer:"-----",enddate: "--------",numberOfQuestions: "--")]),
                          ],
                        ),
                      );
                    }
                    else if (orgContentResponseState.allContentsRequestState ==RequestState.done && orgContentResponseState.orgContentsRequestState ==RequestState.done){
                      return TabBarView(
                        controller: _contentTabController,
                        children: [
                          AllContentItem(chapterId: widget.chapterId.toString(),chapterImage: widget.chapterImage,items: allContentResponseState.allContentResponse,),
                          OrgContentItem(chapterId:widget.chapterId.toString(),chapterImage: widget.chapterImage,contentType: FileType.file,items: orgContentResponseState.OrgContentResponse?.material,),
                          OrgContentItem(chapterId:widget.chapterId.toString(),chapterImage: widget.chapterImage,contentType: FileType.video,items: orgContentResponseState.OrgContentResponse?.videos,),
                          OrgContentItem(chapterId:widget.chapterId.toString(),chapterImage: widget.chapterImage,contentType: FileType.task,items: orgContentResponseState.OrgContentResponse?.assignments,),
                          OrgContentItem(chapterId:widget.chapterId.toString(),chapterImage: widget.chapterImage,contentType: FileType.quiz,items: orgContentResponseState.OrgContentResponse?.quizzes,),
                        ],);
                    }
                    else{
                      return GestureDetector(
                        onTap: (){
                          context.read<GetAllContentsBloc>()..add(GetAllContentsRequestEvent(chapterId: widget.chapterId,userId: int.parse(context.read<CurrentUserBloc>().userData!.id)));
                          context.read<GetAllContentsBloc>()..add(GetOrgContentsRequestEvent(chapterId: widget.chapterId,userId: int.parse(context.read<CurrentUserBloc>().userData!.id)));
                        },
                        child: Container(
                          width: AppConstants.wScreen(context),
                          height: AppConstants.hScreen(context),
                          margin: EdgeInsets.symmetric(
                            horizontal: AppPadding.pHScreen4(context),
                            vertical: AppPadding.pVScreen2(context),
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
                                (allContentResponseState.allContentsMessage == "")?allContentResponseState.allContentsMessage :orgContentResponseState.orgContentsMessage ,
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
            ),
          );
        },
      ),
    );
  }
}
