import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/HomeTabViewModel.dart';
import 'category_widget.dart';

class CategoriesLitWidget extends StatefulWidget {
  const CategoriesLitWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<CategoriesLitWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetCategories();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      buildWhen: (prevState , currentState){
        print("build ${currentState}");
        if(currentState is HomeTabLoadingState || currentState is HomeTabErrorState){
          return false;
        }
        return true;
      },
      listenWhen: (prev , currentState){
        if(currentState is HomeTabLoadingState || currentState is HomeTabErrorState || currentState is HomeTabSuccessState){
          return true;
        }
        return false;
      },
      listener: (context, state) {
        print("Listen $state");
        if(state is HomeTabLoadingState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: SizedBox(
                height: 50.h,
                child: Center(child: CircularProgressIndicator(),),
              ),
            );
          },);
        }
        if(state is HomeTabErrorState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: Text(state.error),
            );
          },);
        }
        if(state is HomeTabSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print(state);
        if(state is HomeTabSuccessState){
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 288.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) => CategoryWidget(category: state.categories[index]),
                itemCount: state.categories.length,
              ),
            ),
          );
        }
        return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
      },
    );
  }
}
