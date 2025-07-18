import 'dart:async';

import 'package:ecomm_368/ui/login/login_page.dart';
import 'package:ecomm_368/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// maintain session
    Timer(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConstants.prefUserToken) ?? "";

      String navigateToName = AppRoutes.login;

      if (token.isNotEmpty) {
        navigateToName = AppRoutes.dashboard;
      }

      Navigator.pushReplacementNamed(context, navigateToName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E88E5),
      body: Center(
        child: Image.asset("assets/images/vertical_logo.png", scale: 3),
      ),
    );
  }
}
