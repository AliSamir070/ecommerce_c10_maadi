import 'package:ecommerce_c10_maadi/core/api/api_manager.dart';
import 'package:ecommerce_c10_maadi/myapp.dart';
import 'package:ecommerce_c10_maadi/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';

void main() {
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(BlocProvider(
      create: (context) => HomeViewModel(),
      child: const MyApp()));
}


