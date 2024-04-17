import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef validation = String? Function(String?);
class CustomFormField extends StatelessWidget {
  String title;
  String hint;
  TextInputType keyboard;
  bool isObscure;
  int? maxLength;
  validation validator;
  TextEditingController controller;
  CustomFormField({super.key,required this.controller,required this.validator,this.maxLength,this.isObscure =false,required this.title,required this.hint,required this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500
        )),
        SizedBox(height: 24.h,),
        TextFormField(
          style: Theme.of(context).textTheme.labelMedium,
          keyboardType: keyboard,
          controller: controller,
          obscureText: isObscure,
          maxLength:maxLength ,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.black.withOpacity(0.7)
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r)
            )
          ),
        )
      ],
    );
  }
}
