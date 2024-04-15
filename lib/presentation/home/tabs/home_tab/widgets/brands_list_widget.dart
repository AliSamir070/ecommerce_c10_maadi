import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/view_model/HomeTabViewModel.dart';
import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/widgets/brand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsListWidget extends StatefulWidget {
  const BrandsListWidget({super.key});

  @override
  State<BrandsListWidget> createState() => _BrandsListWidgetState();
}

class _BrandsListWidgetState extends State<BrandsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTabViewModel>().GetBrands();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
        buildWhen: (previous, current) => current is BrandsSuccessState
      || current is BrandsErrorState || current is BrandsLoadingState,
        builder: (context, state) {
          HomeTabViewModel viewModel = HomeTabViewModel.get(context);
          if(state is BrandsErrorState){
            return Center(child: Text(state.error),);
          }
          if(state is BrandsSuccessState){
            return SizedBox(
              height: 150.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>BrandWidget(brand: state.brands[index]) ,
                  separatorBuilder: (context, index) => SizedBox(width: 20.w,),
                  itemCount: state.brands.length),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
    );
  }
}
