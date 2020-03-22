import 'package:flutter/material.dart';
import 'package:rentllin_flutter/utiities/demoLocalizationsDelegate.dart';
import 'package:rentllin_flutter/views/LanguageSelectionView.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: Locale("en"), // switch between en and ru to see effect
        localizationsDelegates: [const DemoLocalizationsDelegate()],
        supportedLocales: [const Locale('en', ''), const Locale('nl', '')],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelectionView()//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

