import 'package:bloc/bloc.dart';
import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';
import 'package:ecommerce_c10_maadi/domain/usecases/signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_view_model_state.dart';
@injectable
class SignInViewModel extends Cubit<SignInViewModelState> {
  @factoryMethod
  SignInViewModel(this.signInUseCase) : super(SignInViewModelInitial());

  SignInUseCase signInUseCase;
  static SignInViewModel get(context)=>BlocProvider.of(context);

  SignIn({required String email , required String password})async{
    emit(SignInLoadingState());
    var result = await  signInUseCase.call(email: email, password: password);
    result.fold((authEntity){
      emit(SignInSuccessState(authEntity));
    }, (error){
      emit(SignInErrorState(error));
    });
  }
}
