import 'package:flutter/material.dart';

class SlideInFromRight extends PageRouteBuilder {
  SlideInFromRight(_page) : super(
    pageBuilder: (context, animation, secondaryAnimation) => _page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => 
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
          reverseCurve: Curves.linear
        )),
        child: child,
      )
  );
}