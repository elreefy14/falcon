import 'package:falcon/core/core_exports.dart';

class ModuleContentViews extends StatelessWidget {
  const ModuleContentViews({
    super.key,
    required this.module,
    required this.isMyLearning,
  });
  final ModuleEntity module;
  final bool isMyLearning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        context: context,
        title: module.name,
        hasArrowBack: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppPadding.pVScreen1(context),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppPadding.pHScreen4(context),),
            child: Text(
              "${module.description}",
              style: getBoldStyle(color: ColorManager.textGrey,fontSize: 10),
            ),
          ),
          SizedBox(height: AppPadding.pVScreen1(context),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:AppPadding.pHScreen4(context),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "# All Subjects",
                  style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s10),
                ),
                (isMyLearning==false)?GetContentBottom(
                  typeContent:DetailsType.Module ,
                  title: module.name,
                  id: module.id,
                  price: double.parse(module.price),
                  isTextBottom: true,
                ):SizedBox(),
              ],
            ),
          ),
          SizedBox(height: AppPadding.pVScreen1(context),),
          Container(
            height: 1.6,
            width: AppConstants.wScreen(context),
            decoration: BoxDecoration(
              color: ColorManager.lightGrey,
              boxShadow: [
                BoxShadow(
                    color: ColorManager.lightGrey,
                    offset:Offset(0,0.5),
                    blurRadius: 2,
                    spreadRadius: 1
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (BuildContext context)=> GetSubjectsBloc(getUserSubjectsUsecase: sl<GetUserSubjectsUsecase>())
                ..add(GetSubjectsRequestEvent(moduleId:int.parse(module.id))),//todo module.id
              child: BlocBuilder<GetSubjectsBloc,GetSubjectsState>(
                  builder: (context , subjectsResponseState) {
                    if(subjectsResponseState.requestState ==RequestState.loading){
                      return Skeletonizer(
                        child: ListView.separated(
                          itemCount: 10,
                          padding: EdgeInsets.symmetric(
                            horizontal:AppPadding.pHScreen4(context),
                            vertical:AppPadding.pVScreen2(context),
                          ),
                          separatorBuilder: (context, index) => Divider(color: ColorManager.lightGrey,thickness: 1,),
                          itemBuilder: (context,index){
                            return SubjectOfModuleItem(isMyLearning: isMyLearning,subject:SubjectEntity(id:"", image: "", imageUrl: "", name: "---------------------------", price: "----", doctors: [], chapters: [], description: "---------------------------"),);
                          },
                        ),
                      );
                    }else if(subjectsResponseState.requestState ==RequestState.done){
                      //todo demo subject
                      final List<SubjectEntity> subjectsDemo = [
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                        SubjectEntity(id: "6", image: AssetsManager.image_4, imageUrl: "https://repository-images.githubusercontent.com/195860046/06089740-270a-4cba-8b6e-2639377b5ccd", name: "Dart", price: "55", description: "description", doctors: [DoctorEntity(id: "12", image: AssetsManager.image_4, imageUrl: "", name: "moAbdulstar", phone: "01099516598", description: "Doctor at Kasr Alainy School of Medicine - Cairo University")], chapters: []),
                      ];
                      //return (subjectsResponseState.subjectsResponse.isNotEmpty)?ListView.separated(
                      return (subjectsResponseState.subjectsResponse.isEmpty)?ListView.separated(
                        //itemCount:subjectsResponseState.subjectsResponse.length,
                        itemCount:subjectsDemo.length,
                        padding: EdgeInsets.symmetric(
                          horizontal:AppPadding.pHScreen4(context),
                          vertical:AppPadding.pVScreen2(context),
                        ),
                        separatorBuilder: (context, index) => Divider(color: ColorManager.lightGrey,thickness: 1,),
                        itemBuilder: (context,index){
                          //return SubjectOfModuleItem(isMyLearning: isMyLearning,subject: subjectsResponseState.subjectsResponse[index],);
                          return SubjectOfModuleItem(isMyLearning: isMyLearning,subject: subjectsDemo[index],);
                        },
                      ):CustomEmptyComponent(emptyItemType: "subject");
                    }
                    else{
                      return GestureDetector(
                        onTap: (){
                          context.read<GetSubjectsBloc>().add(GetSubjectsRequestEvent(moduleId:int.parse(module.id)));
                        },
                        child: Container(
                          width: AppConstants.wScreen(context),
                          height: AppConstants.hScreen(context)*0.7,
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
                                subjectsResponseState.getSubjectsMessage,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectOfModuleItem extends StatelessWidget {
  const SubjectOfModuleItem({
    super.key,
    required  this.subject,
    required  this.isMyLearning
  });

  final SubjectEntity subject ;
  final bool isMyLearning;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow.shade200,
      margin: EdgeInsets.only(
        bottom:AppPadding.pHScreen1(context),
        top:AppPadding.pHScreen1(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(
                child: DetailsView(
                  isMyLearning: isMyLearning,
                  type: DetailsType.Subject,
                  imageUrl: subject.imageUrl,
                  subject: subject,
                ),
                type: PageTransitionType.fade,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(milliseconds: AppConstants.pageTransition200),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(left:Radius.circular(AppRadius.r10)),
              child:CachedNetworkImage(
                imageUrl:subject.imageUrl!,
                height: AppConstants.hScreen(context)*0.14,
                width: AppConstants.wScreen(context)*0.35,
                fit: BoxFit.fill,
                placeholder: (context, url) => Skeletonizer(
                  child: Container(
                    color: ColorManager.lightGrey,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AssetsManager.defaultImage,
                  height: AppConstants.hScreen(context)*0.14,
                  width: AppConstants.wScreen(context)*0.35,
                  fit: BoxFit.fill,
                ),

              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(AppRadius.r8),
            //   child: SizedBox(
            //     height: AppConstants.hScreen(context)*0.14,
            //     width: AppConstants.wScreen(context)*0.35,
            //     child: Image.asset(
            //       AssetsManager.subjectIcon,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, PageTransition(
                  child: SubjectContentViews(
                    isMyLearning: isMyLearning,
                    subject: subject,
                  ),
                  type: PageTransitionType.fade,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: AppConstants.pageTransition200),
                ));
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal:AppPadding.pHScreen4(context),
                  vertical:AppPadding.pVScreen06(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${subject.name}",
                      style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s10),
                    ),
                    SizedBox(height: AppPadding.pVScreen06(context),),
                    Text(
                      "${subject.description}",
                      style: getMediumStyle(color: ColorManager.textGrey,fontSize: FontSize.s9),
                    ),
                    SizedBox(height: AppPadding.pVScreen06(context),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${subject.chapters?.length} Chapters",
                          style: getBoldStyle(color: ColorManager.textGrey,fontSize: FontSize.s10),
                        ),
                        Text(
                          "20.0 E£",
                          style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
