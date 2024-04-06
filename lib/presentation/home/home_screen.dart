import 'package:ecommerce_c10_maadi/presentation/home/tabs/home_tab/homeTab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
    );
  }
}
