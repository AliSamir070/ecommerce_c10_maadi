import 'package:ecommerce_c10_maadi/config/theme/apptheme.dart';
import 'package:ecommerce_c10_maadi/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_maadi/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>MaterialApp(
        title: 'Flutter Demo',
        routes: {
          RoutesManager.homeRouteName:(_)=>HomeScreen()
        },
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: RoutesManager.homeRouteName,
      ),
    );
  }
}
