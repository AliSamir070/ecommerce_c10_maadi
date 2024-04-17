import 'package:ecommerce_c10_maadi/core/DI/di.dart';
import 'package:ecommerce_c10_maadi/core/utils/colors_manager.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/categories_tab/view_model/CategoriesViewModel.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/categories_tab/widget/category_selection_widget.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/categories_tab/widget/subcategory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
  CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<CategoriesViewModel>()
        ..GetCategories(),
      child: BlocConsumer<CategoriesViewModel, CategoriesStates>(
        listener: (context, state) {
          if(state is GetCategoriesSuccessState){
            context.read<CategoriesViewModel>().GetSubCategories(state.categories[selectedIndex].id??"");
          }
        },
        buildWhen: (previous, current) {
          if(current is GetCategoriesErrorState || current is GetCategoriesSuccessState || current is GetCategoriesLoadingState){
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if(state is GetCategoriesSuccessState){
            return Padding(
              padding: REdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 137.w,
                    decoration: BoxDecoration(
                      color: ColorManager.categoriesBackgroundColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3)
                      )
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) => CategorySelectionWidget(
                          selectCategory: (){
                            selectedIndex = index;
                            setState(() {

                            });
                            CategoriesViewModel.get(context).GetSubCategories(state.categories[selectedIndex].id??"");
                          },
                          categoryEntity: state.categories[index],
                          isSelected: index==selectedIndex,
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                        itemCount: state.categories.length),
                  ),
                  Expanded(
                      child: BlocBuilder<CategoriesViewModel , CategoriesStates>(
                          buildWhen: (previous, current) {
                            if(current is GetSubCategoriesSuccessState
                                || current is GetSubCategoriesErrorState
                                || current is GetSubCategoriesLoadingState){
                              return true;
                            }
                            return false;
                          },
                          builder: (context, state) {
                            if(state is GetSubCategoriesSuccessState){
                              return GridView.builder(
                                  itemCount: state.subcategories.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    childAspectRatio: 1/2,
                                    crossAxisSpacing: 13.w,
                                    mainAxisSpacing: 16.h
                                  ),
                                  itemBuilder: (context, index) => SubCategoryWidget(subcategory: state.subcategories[index]),
                              );
                            }
                            if(state is GetSubCategoriesErrorState){
                              return Center(child: Text(state.error),);
                            }
                            return Center(child: CircularProgressIndicator(),);
                          },
                      )
                  )
                ],
              ),
            );
          }
          if(state is GetCategoriesErrorState){
            return Center(child: Text(
              state.error,style: Theme.of(context).textTheme.headlineLarge,
            ),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
