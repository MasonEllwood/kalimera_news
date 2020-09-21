import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/pages/kalimera_splash.dart';
import 'package:flutterNews/src/pages/kalimera_home.dart';
import 'package:flutterNews/src/transitions/fade_in_transition.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';


void main() => runApp(Kalimera());


class Kalimera extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  withProviders(
      context,
      MaterialApp(
        title: 'Kalimera App',
        initialRoute: '/splash',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/splash':
              return FadeIn(KalimeraSlash(), settings);
            case '/home':
              return FadeIn(KalimeraHome(), settings);
            case '/':
            default:
              return FadeIn(KalimeraHome(), settings);
          }
        }
      ),
    );
  }

  Widget withProviders(BuildContext context, Widget page) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<KalimeraNewsList>(create: (_) => KalimeraNewsList()),
    ], child: page);
  }

}
