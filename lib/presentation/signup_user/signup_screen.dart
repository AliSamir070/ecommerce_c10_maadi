import 'package:ecommerce_c10_maadi/core/DI/di.dart';
import 'package:ecommerce_c10_maadi/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_maadi/presentation/signup_user/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/constants.dart';
import '../../core/local/prefs_helper.dart';
import '../../core/reusable_components/custom_button.dart';
import '../../core/reusable_components/custom_form_field.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/strings_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController mobilePhoneController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    mobilePhoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    mobilePhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupViewModel>(),
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
                  CustomFormField(
                      controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return StringsManager.cantBeEmpty;
                        }
                      },
                      title: StringsManager.fullNameTitle,
                      hint: StringsManager.fullNameHint,
                      keyboard: TextInputType.name),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormField(
                      controller: mobilePhoneController,
                      maxLength: 11,
                      validator: (value) {
                        if (value!.length < 11) {
                          return StringsManager.notValidPhone;
                        }
                      },
                      title: StringsManager.phoneTitle,
                      hint: StringsManager.phoneHint,
                      keyboard: TextInputType.phone),
                  SizedBox(
                    height: 32.h,
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
                  SizedBox(
                    height: 56.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<SignupViewModel, SignupViewModelState>(
                      listener: (context, state) {
                        if(state is SignupErrorState){
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
                        if(state is SignupSuccessState){
                          print(state.token);
                          PrefsHelper.setToken(state.token);
                          Fluttertoast.showToast(
                              msg: "User created successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pushNamedAndRemoveUntil(context, RoutesManager.homeRouteName, (route) => false);
                        }
                      },
                      builder: (context, state) {
                        if(state is SignupLoadingState){
                          return Center(child: CircularProgressIndicator(
                            color: Colors.white,
                          ),);
                        }
                        return CustomButton(
                          title: StringsManager.signup,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              SignupViewModel.get(context).SignUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: fullNameController.text,
                                  mobile: mobilePhoneController.text
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
