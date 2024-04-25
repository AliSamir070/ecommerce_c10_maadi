part of 'sign_in_view_model_cubit.dart';

@immutable
abstract class SignInViewModelState {}

class SignInViewModelInitial extends SignInViewModelState {}
class SignInLoadingState extends SignInViewModelState{}
class SignInSuccessState extends SignInViewModelState{
  AuthEntity authEntity;
  SignInSuccessState(this.authEntity);
}
class SignInErrorState extends SignInViewModelState{
  String error;
  SignInErrorState(this.error);
}
