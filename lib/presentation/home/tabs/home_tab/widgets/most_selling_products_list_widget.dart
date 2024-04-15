import 'package:ecommerce_c10_maadi/core/reusable_components/product_widget.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/view_model/HomeTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() => _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState extends State<MostSellingProductsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().GetMostSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
        buildWhen: (previous, current) {
          if(current is MostSellingProductsErrorState || current is MostSellingProductsSuccessState || current is MostSellingProductsLoadingState){
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if(state is MostSellingProductsSuccessState){
            return SizedBox(
              height: 245.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => ProductWidget(productEntity: state.products[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                  itemCount: state.products.length
              ),
            );
          }
          if(state is MostSellingProductsErrorState){
            return Text(
              state.error,
              style: Theme.of(context).textTheme.headlineLarge,
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
    );
  }
}
