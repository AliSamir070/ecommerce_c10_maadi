part of 'signup_view_model_cubit.dart';

@immutable
abstract class SignupViewModelState {}

class SignupViewModelInitial extends SignupViewModelState {}
class SignupLoadingState extends SignupViewModelState{}
class SignupErrorState extends SignupViewModelState{
  String error;
  SignupErrorState(this.error);
}
class SignupSuccessState extends SignupViewModelState{
  String token;
  SignupSuccessState(this.token);
}

