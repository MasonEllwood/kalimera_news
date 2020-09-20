import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/buttons/kalimera_icon_button.dart';
import 'package:flutterNews/src/widgets/general/kalimera_current_date.dart';

class KalimeraHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container( 
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: KalmeraIconButton(
                      onTap: (){
                        print('Menu Clicked');
                      }
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: KalmeraGetDate(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}