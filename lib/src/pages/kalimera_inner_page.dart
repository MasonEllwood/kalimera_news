import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/general/kalimera_inner_header.dart';

class KalimeraInnerPage extends StatefulWidget {
  @override
  _KalimeraInnerPageState createState() => _KalimeraInnerPageState();
}

class _KalimeraInnerPageState extends State<KalimeraInnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Column(
              children: <Widget> [
                KalimeraInnerHeader(),
              ]
            );
          }
        )
      ),
    );
  }
}