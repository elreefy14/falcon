import 'dart:io';

import 'package:falcon/core/core_exports.dart';
import 'package:flutter/services.dart';

class DeveloperModeDetectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: AppConstants.hScreen(context),
        width: AppConstants.wScreen(context),
        child: BlocListener<DeveloperModeDetectionBloc, DeveloperModeDetectionState>(
          listener: (context, state) async{
            // todo active developer mode by change condition
            if (state is   DeveloperModeEnabled) {      //  DeveloperModeEnabled in debug //  todo it must be DeveloperModeDisabled
              bool isEmulator = await isRunningOnEmulator();
              if (isEmulator) {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      child: DeveloperModeScreen(isEmulator:true),
                      type: PageTransitionType.fade,
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: const Duration(milliseconds: AppConstants.pageTransition200),
                    ), (Route<dynamic> route) => false
                );
              }
              else{
                final isSigned = await CacheHelper.getData(key: "isSigned");
                if (isSigned != null) {
                  final id = await CacheHelper.getData(key: "id");
                  final name = await CacheHelper.getData(key: "name");
                  final email = await CacheHelper.getData(key: "email");
                  final phone = await CacheHelper.getData(key: "phone");
                  final university =
                      await CacheHelper.getData(key: "university");
                  final faculty = await CacheHelper.getData(key: "faculty");
                  final level = await CacheHelper.getData(key: "level");
                  final fcmToken = await CacheHelper.getData(key: "fcmToken");

                  context.read<CurrentUserBloc>().add(SaveCurrentUserEvent(
                          userData: UserEntity(
                        id: id,
                        name: name,
                        phone: phone,
                        email: email,
                        university: university,
                        faculty: faculty,
                        level: level,
                        fcmToken: fcmToken,
                        deviceId: null,
                      )));

                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: BottomBarView(),
                        type: PageTransitionType.fade,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: const Duration(
                            milliseconds: AppConstants.pageTransition200),
                      ),
                      (Route<dynamic> route) => false);
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: LoginView(),
                        type: PageTransitionType.fade,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: const Duration(
                            milliseconds: AppConstants.pageTransition200),
                      ),
                      (Route<dynamic> route) => false);
                }
              }
            }


            else if (state is  DeveloperModeDisabled ) {  //  DeveloperModeDisabled in debug //  todo it must be DeveloperModeEnabled
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: DeveloperModeScreen(isEmulator:false),
                    type: PageTransitionType.fade,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: AppConstants.pageTransition200),
                  ), (Route<dynamic> route) => false
              );
            }
            else if (state is DeveloperModeDetectionFailure) {
              // Handle error state if needed
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Container(),
        ),
      ),
    );
  }
}
//we have detected the following security issues in your mobile, resolve the issues then restart the application
class DeveloperModeScreen extends StatefulWidget {
  DeveloperModeScreen({required bool this.isEmulator});

  final bool isEmulator;
  @override
  State<DeveloperModeScreen> createState() => _DeveloperModeScreenState();


}

class _DeveloperModeScreenState extends State<DeveloperModeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6),(){
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      exit(0);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        context: context,
        hasCenterWidget:true,
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerWidget: Padding(
          padding: EdgeInsets.only(top:AppConstants.hScreen(context)* 0.02,),
          child: Row(
            children: [
              SizedBox(
                width: AppConstants.wScreen(context)*0.14,
              ),
              Image.asset(AssetsManager.logo,width: AppConstants.wScreen(context)*0.1,),
              SizedBox(width: AppConstants.wScreen(context)*0.02,),
              Text(
                "BLUE FALCON",
                style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16),
              ),

            ],
          ),
        ),
        title:"",
      ),
      body: Column(
        children: [
          SizedBox(
            width: AppConstants.wScreen(context),
            height: AppConstants.hScreen(context)*0.06,
          ),
          Flexible(
            child: Text(
              'Security Issues',
              style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s28),
            ),
          ),
          SizedBox(
            height: AppConstants.hScreen(context)*0.04,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pHScreen6(context),
              ),
              child: Text(
                'we have detected the following security issues in your mobile, resolve the issues then restart the application',
                style: getBoldStyle(color: ColorManager.darkGrey.withOpacity(0.8),fontSize: FontSize.s12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: AppConstants.hScreen(context)*0.06,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.pHScreen4(context),
              vertical: AppPadding.pVScreen2(context),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: AppPadding.pHScreen6(context),
            ),
            decoration: BoxDecoration(
              color: ColorManager.lightGrey,
              borderRadius: BorderRadius.circular(AppRadius.r10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.pHScreen4(context),
                    vertical: AppPadding.pVScreen04(context),
                  ),
                  child: Icon(Icons.developer_mode_rounded,color: ColorManager.primary,size: AppSize.s30,),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.isEmulator?'Emulator Device':'Developer Mode',
                        style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),
                      ),
                      SizedBox(
                        height:AppPadding.pVScreen04(context),
                      ),
                      Text(
                        widget.isEmulator?"Sorry you cant open this application on emulator device for security purposes"
                            :'Developer Mode should be turned of while using this application for security purposes',
                        style: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s12),
                      ),

                    ],
                  ),
                ) ,
              ],
            ),
          ),
          SizedBox(
            height: AppConstants.hScreen(context)*0.32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.pHScreen4(context),
            ),
            child: CustomButton(
              onPressed: (){
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                exit(0);
              },
              text: "Exit from app",
              elevation: 4,
            ),
          ),
        ],
      ),
    );
  }
}