import 'package:falcon/core/core_exports.dart';

part 'main_nav_bar_state.dart';


List<Widget> mainNavPage =  [ HomeBody() , MyLearningBody() , DoctorsBody() , ProfileBody() ];// TasksBody()
List<String> nameNavPages = const[ "Home", "My Learning", "Doctors" , "Profile"];// Tasks

class MainNavBarCubit extends Cubit<MainNavBarState> {
  int currentPage = 0;
  Widget navBody = const HomeBody();
  String navNme = "Home";

  MainNavBarCubit() : super(MainNavBarInitial());

  void chooseNavPage ({required BuildContext context,required int indexPage}){
    currentPage = indexPage;
    navBody = mainNavPage[indexPage];
    navNme = nameNavPages[indexPage];
    emit(MainScreenChanged(currentPage:currentPage,page: navBody,navNme: navNme));
  }


  }



