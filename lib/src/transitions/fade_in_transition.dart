import 'package:flutter/material.dart';

class FadeIn extends PageRouteBuilder {
  FadeIn(_page, _settings) : super(
    pageBuilder: (context, animation, secondaryAnimation) => _page,
    settings: _settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
          reverseCurve: Curves.linear,
        )),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 200) 
  );
}