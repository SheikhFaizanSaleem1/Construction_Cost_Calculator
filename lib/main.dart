import 'package:flutter/material.dart';
import './home_page_calculator.dart';
import 'comission_calculator.dart';
import './tipcalc.dart';

import 'labour_rate_calculaor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
//        appBarTheme: ,

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ConstructionRate_Calculator(),
      routes: {
        ConstructionRate_Calculator.routeName: (ctx) => ConstructionRate_Calculator(),
      },
    );
  }
}

