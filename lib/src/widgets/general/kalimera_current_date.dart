import 'package:flutter/material.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';

class KalmeraGetDate extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var arrayMonth = ['Jan','Feb','Mar','Apr','May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var formattedDate = "${arrayMonth[dateParse.month - 1]} ${dateParse.day}, ${dateParse.year}";
    String finalDate = formattedDate.toString();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "$finalDate",
              style: KalimeraTextStyles.questrialLightForest18px,
            ),
          ),
        );
      }
    );
  }
}