import 'package:ecommerce_c10_maadi/core/local/prefs_helper.dart';
import 'package:ecommerce_c10_maadi/core/reusable_components/custom_form_field.dart';
import 'package:ecommerce_c10_maadi/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_maadi/presentation/signin_user/view_model/sign_in_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/DI/di.dart';
import '../../core/constants.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/strings_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInViewModel>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsManager.route,
                      height: 71.h,
                      width: 237.w,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  Text(
                    StringsManager.welcomeMessage,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    StringsManager.pleaseSignIn,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormField(
                      controller: emailController,
                      validator: (value) {
                        if (!Constants.emailRegex.hasMatch(value ?? "")) {
                          return StringsManager.notValidEmail;
                        }
                      },
                      title: StringsManager.emailTitle,
                      hint: StringsManager.emailHint,
                      keyboard: TextInputType.emailAddress),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormField(
                    controller: passwordController,
                    validator: (value) {
                      if ((value?.length ?? 0) < 8) {
                        return StringsManager.notValidPassword;
                      }
                    },
                    title: StringsManager.passwordTitle,
                    hint: StringsManager.passwordHint,
                    keyboard: TextInputType.visiblePassword,
                    isObscure: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      StringsManager.forgotPass,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignInViewModel, SignInViewModelState>(
                      listener: (context, state) {
                        if(state is SignInSuccessState){
                          PrefsHelper.setToken(state.authEntity.token??"");
                          Fluttertoast.showToast(
                              msg: "Logged in successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pushNamedAndRemoveUntil(context, RoutesManager.homeRouteName, (route) => false);
                        }
                        if(state is SignInErrorState){
                          Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      builder: (context, state) {
                        if(state is SignInLoadingState){
                          return Center(child: CircularProgressIndicator(color: Colors.white,),);
                        }
                        return CustomButton(
                          title: StringsManager.login,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              SignInViewModel.get(context).SignIn(email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesManager.signUpRouteName);
                      },
                      child: Text(
                        StringsManager.dontHaveAcc,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
