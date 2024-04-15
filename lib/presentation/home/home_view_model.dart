import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeInitialState());

  static HomeViewModel get(context)=>BlocProvider.of(context);

  int currentTabIndex = 0;

  void changeBottomNavTab(int newIndex){
    currentTabIndex = newIndex;
    emit(HomeChangeTabState());
  }
}

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeChangeTabState extends HomeStates{}