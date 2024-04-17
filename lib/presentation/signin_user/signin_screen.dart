import 'package:ecommerce_c10_maadi/core/reusable_components/custom_form_field.dart';
import 'package:ecommerce_c10_maadi/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Form(
            key:formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AssetsManager.route,
                    height: 71.h,
                    width: 237.w,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 86.h,),
                Text(StringsManager.welcomeMessage,style: Theme.of(context).textTheme.headlineMedium,),
                Text(StringsManager.pleaseSignIn,style:Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp
                ) ,),
                SizedBox(height: 40.h,),
                CustomFormField(
                    controller: emailController,
                    validator: (value){
                    if(!Constants.emailRegex.hasMatch(value??"")){
                      return StringsManager.notValidEmail;
                    }
                }, title: StringsManager.emailTitle, hint: StringsManager.emailHint, keyboard: TextInputType.emailAddress),
                SizedBox(height: 32.h,),
                CustomFormField(
                  controller: passwordController,
                  validator: (value){
                  if((value?.length??0)<8){
                    return StringsManager.notValidPassword;
                  }
                }, title: StringsManager.passwordTitle, hint: StringsManager.passwordHint, keyboard: TextInputType.visiblePassword,isObscure: true,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    StringsManager.forgotPass,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp
                    ),
                  ),
                ),
                SizedBox(height: 56.h,),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: StringsManager.login,
                    onPressed: (){
                      if(formKey.currentState?.validate()??false){

                      }
                    },
                  ),
                ),
                SizedBox(height: 32.h,),
                TextButton(
                    onPressed:(){
                      Navigator.pushNamed(context, RoutesManager.signUpRouteName);
                    },
                    child: Text(StringsManager.dontHaveAcc,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                    ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
