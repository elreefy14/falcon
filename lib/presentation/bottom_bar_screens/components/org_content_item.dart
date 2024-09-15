import 'package:falcon/core/core_exports.dart';


class OrgContentItem extends StatelessWidget {
  const OrgContentItem({
    super.key,
    required this.contentType,
    required this.items,
  });
   final FileType contentType ;
   final List<ContentEntity>? items ;
  @override
  Widget build(BuildContext context) {
    if(contentType == FileType.task){
      return CustomAssignmentItem(items:items);
    }
    else if (contentType == FileType.quiz){
      return CustomQuizItem(items:items);
    }
    else {
      return GestureDetector(
        onTap: (){
          if(contentType==FileType.file){
            Navigator.push(context, PageTransition(
              child: PdfViewerPage(pdfPath: "assets/files/pdf_example.pdf"),
              type: PageTransitionType.fade,
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(milliseconds: AppConstants.pageTransition200),
            ));
          }
          else if (contentType==FileType.video){

          }
        },
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: AppPadding.pHScreen4(context),
            vertical: AppPadding.pVScreen1(context),
          ),
          child: ListView.builder(
            itemCount: items?.length,
            padding: EdgeInsets.all(0),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  if (contentType==FileType.video){
                    Navigator.push(context, PageTransition(
                      child: VideoPlayerScreen(link:"https://www.youtube.com/watch?v=VPvVD8t02U8",),
                      type: PageTransitionType.fade,
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: const Duration(milliseconds: AppConstants.pageTransition200),
                    ));
                  }
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: AppPadding.pVScreen08(context),
                  ),
                  child: Container(
                    width: AppConstants.wScreen(context),
                    height: AppConstants. hScreen(context)*0.1,
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey,
                      borderRadius: BorderRadius.circular(AppRadius.r10,),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: AppPadding.pHScreen6(context)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.r10),
                          child: Container(
                            width: AppConstants.wScreen(context)*0.13,
                            height: AppConstants.hScreen(context)*0.06,
                            decoration: BoxDecoration(
                            ),
                            child: Image.asset(
                              (contentType==FileType.video)
                                  ? AssetsManager.videoIcon
                                  : AssetsManager.pdfIcon,
                              width: AppConstants.wScreen(context)*0.13,
                              height: AppConstants.hScreen(context)*0.06,
                              fit: BoxFit.fill,

                            ),
                          ),
                        ),
                        SizedBox(width: AppPadding.pHScreen2(context)),
                        Flexible(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: AppPadding.pHScreen2(context),
                              vertical: AppPadding.pVScreen2(context),
                            ),
                            child: Text(
                              "${items?[index].name}",
                              style: getBoldStyle(color: ColorManager.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}

//
//