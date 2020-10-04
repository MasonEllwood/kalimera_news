import 'package:flutter/material.dart';
import 'package:flutterNews/src/styles/kalimera_colors.dart';

typedef OnTap = void Function();

class KalmeraIconButton extends StatelessWidget {

  final OnTap onTap;

  KalmeraIconButton({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                Icons.menu,
                color: KalimeraColors.lightforest,
                size: 30.0,
              ),
            ),
          ),
        );
      }
    );
  }
}