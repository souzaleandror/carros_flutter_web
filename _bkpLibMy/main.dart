import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => AppModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: HomePage(),
      ),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      splashColor: Colors.blue[200],
      hoverColor: Colors.blue,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20),
          bodyText1: TextStyle(fontSize: 20)),
    );
  }
}
