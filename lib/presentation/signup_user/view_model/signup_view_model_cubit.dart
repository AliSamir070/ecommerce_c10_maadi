import 'package:bloc/bloc.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/signup_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'signup_view_model_state.dart';
@injectable
class SignupViewModel extends Cubit<SignupViewModelState> {
  @factoryMethod
  SignupViewModel(this.signUpUseCase) : super(SignupViewModelInitial());
  static SignupViewModel get(BuildContext context)=>BlocProvider.of(context);

  SignUpUseCase signUpUseCase;

  SignUp({required String email, required String password, required String name, required String mobile})async{
    emit(SignupLoadingState());
    var result = await signUpUseCase.call(email: email, password: password, name: name, mobile: mobile);
    result.fold((response){
      emit(SignupSuccessState(response.token??""));
    }, (error) {
      emit(SignupErrorState(error));
    });
  }
}
