import 'package:falcon/core/core_exports.dart';

class BottomBarView extends StatelessWidget {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainNavBarCubit()),
        BlocProvider(create: (_) => TasksTabBloc()),
      ],
      child: BlocBuilder<MainNavBarCubit, MainNavBarState>(
        builder: (context, state) {
          int currentPge = (state is MainScreenChanged)?  state.currentPage: 0;
          return Scaffold(
           // backgroundColor: Color(0xfffcfcfc),
            appBar:CustomAppBar(
              context: context,
              hasCenterWidget: currentPge==0?true:false,
              hasTitle: currentPge==0?false:true,
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
                      "Blue FALCON",
                      style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16),
                    ),

                  ],
                ),
              ),
              title: (state is MainScreenChanged)?state.navNme:"Home",
            ),
            bottomNavigationBar: CustomMainNavBar(currentPge: currentPge,),
            body: (state is MainScreenChanged)?state.page:const HomeBody(),
          );
        },
      ),
    );
  }
}
