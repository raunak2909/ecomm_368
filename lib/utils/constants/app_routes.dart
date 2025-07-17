import 'package:ecomm_368/ui/dashboard/dashboard_page.dart';
import 'package:ecomm_368/ui/login/login_page.dart';
import 'package:ecomm_368/ui/sign_up/signup_page.dart';
import 'package:ecomm_368/ui/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {

  static const String splash = "/";
  static const String login = "/login";
  static const String signUp = "/signup";
  static const String dashboard = "/dashboard";


  static Map<String, WidgetBuilder> mRoutes = {
    splash : (_) => SplashScreen(),
    login : (_) => LoginScreen(),
    signUp : (_) => SignupScreen(),
    dashboard : (_) => DashBoardScreen(),
  };

}