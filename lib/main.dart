import 'package:ecomm_368/data/remote/helper/api_helper.dart';
import 'package:ecomm_368/data/remote/repository/product_repo.dart';
import 'package:ecomm_368/data/remote/repository/user_repo.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_bloc.dart';
import 'package:ecomm_368/ui/sign_up/bloc/user_bloc.dart';
import 'package:ecomm_368/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UserBloc(userRepo: UserRepository(apiHelper: ApiHelper())),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository: ProductRepository(apiHelper: ApiHelper()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
