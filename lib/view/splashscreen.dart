import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wargaku/model/user.dart';
import 'package:wargaku/provider/auth/auth_provider.dart';
import 'package:wargaku/service/preferences/user_preferences.dart';
import 'package:wargaku/view/bottombar/navbottom.dart';
import 'package:wargaku/view/login/login.dart';
import 'package:wargaku/view/onbonding.dart';
import 'package:wargaku/view/utils/colornotifire.dart';
import 'package:wargaku/view/utils/media.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
  }

  void checkUser()async{
    await Future.delayed(Duration(seconds: 3));
    User? user = await UserPreferences.getUser();
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbottom()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onbonding()));
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: height,
            width: width,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/icon/wargaku-spalshscreen.png",
                  height: height / 2,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              "Wargaku 1.2.3",
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
                fontFamily: 'Gilroy Bold',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
