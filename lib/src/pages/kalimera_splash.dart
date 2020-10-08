// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterNews/src/styles/kalimera_colors.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';

class KalimeraSlash extends StatefulWidget {
  @override
  _KalimeraSlashState createState() => new _KalimeraSlashState();
}

class _KalimeraSlashState extends State<KalimeraSlash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KalimeraColors.lightblue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLiquidFill(
                    text: 'Kalimera',
                    waveColor: Colors.white,
                    boxBackgroundColor: KalimeraColors.lightblue,
                    textStyle: KalimeraTextStyles.questrial60px,
                    boxHeight: 150.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Search for whatever",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Search cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        )
      ),
    );
  }
}