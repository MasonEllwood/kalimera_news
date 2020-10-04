// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutterNews/src/styles/kalimera_colors.dart';
import 'package:flutterNews/src/pages/kalimera_home.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';

class KalimeraSlash extends StatefulWidget {
  @override
  _KalimeraSlashState createState() => new _KalimeraSlashState();
}

class _KalimeraSlashState extends State<KalimeraSlash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text( 'Kalimera', style: KalimeraTextStyles.questrialWhite45px ),
      seconds: 3,
      navigateAfterSeconds: KalimeraHome(),
      backgroundColor: KalimeraColors.lightblue,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => Navigator.of(context).pop(),
      loaderColor: Colors.white,
    );
  }
}
