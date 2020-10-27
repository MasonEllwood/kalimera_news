import 'package:flutter/material.dart';
import 'package:flutterNews/src/styles/kalimera_colors.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';

typedef OnChanged = void Function(String);

final key = new GlobalKey<_KalimeraSearchBarLiveState>();

class KalimeraSearchBarLive extends StatefulWidget{
  final OnChanged onChanged;
  final TextInputType textInputType;
  final TextStyle inputTextStyle;
  final TextStyle hintTextTextStyle;
  final String hint;
  final String initialText;

  KalimeraSearchBarLive({
    @required this.onChanged,
    this.textInputType = TextInputType.text,
    this.inputTextStyle = KalimeraTextStyles.questrialBlack18px,
    this.hintTextTextStyle = KalimeraTextStyles.questrialBlack18px,
    this.hint,
    this.initialText,
    Key key,
  }) : super(key: key);

  @override
  _KalimeraSearchBarLiveState createState() => _KalimeraSearchBarLiveState();
}

class _KalimeraSearchBarLiveState extends State<KalimeraSearchBarLive> {

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialText
    ); 
  }

  clearState() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);

    return Container(
      constraints: BoxConstraints.expand(
        height: 52
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: KalimeraColors.offWhite,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Icon(
              Icons.search,
              color: KalimeraColors.lightblue,
              size: 24.0,
            ),
          ),
          Expanded(
            child: TextField(
              autofocus: false,
              controller: _controller,
              style: widget.inputTextStyle,
              onChanged: (input){
                widget.onChanged(input);
                // _newsList.getNews();
              },
              onSubmitted: (input){
                print(input);
                _newsList.getNews();
              },
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                hintText: widget.hint,
                hintStyle: widget.hintTextTextStyle,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      )
    );
  }
}