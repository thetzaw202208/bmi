import 'dart:async';

import 'package:bmi/const/img.dart';
import 'package:bmi/screen/home/market_price.dart';
import 'package:bmi/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  init()async{
    SharedPreferences sh=await SharedPreferences.getInstance();
    var isLogin= sh.getBool("isLogin");
    if(isLogin==true){
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MarketPriceScreen()),
                (Route<dynamic> route) => false);
      });
    }else if(isLogin==null || isLogin==false){
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(bmiLogo),
      ),
    );
  }
}
