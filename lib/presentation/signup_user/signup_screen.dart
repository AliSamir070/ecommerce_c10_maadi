import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants.dart';
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
                CustomFormField(
                    controller: fullNameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return StringsManager.cantBeEmpty;
                      }
                    }, title: StringsManager.fullNameTitle, hint: StringsManager.fullNameHint, keyboard: TextInputType.name),
                SizedBox(height: 32.h,),
                CustomFormField(
                    controller: mobilePhoneController,
                    maxLength: 11,
                    validator: (value){
                      if(value!.length <11){
                        return StringsManager.notValidPhone;
                      }
                    }, title: StringsManager.phoneTitle, hint: StringsManager.phoneHint, keyboard: TextInputType.phone),
                SizedBox(height: 32.h,),
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
                SizedBox(height: 56.h,),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: StringsManager.signup,
                    onPressed: (){
                      if(formKey.currentState?.validate()??false){

                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
