import 'package:carros_flutter_web/constants.dart';
import 'package:carros_flutter_web/web/header.dart';
import 'package:carros_flutter_web/web/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get sized => MediaQuery.of(context).size;
  bool get showMenu => sized.width > 600;

  @override
  Widget build(BuildContext context) {
    print("Home");

    return Scaffold(
      body: Column(
        children: [
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
        padding: EdgeInsets.all(16),
        width: sized.width,
        height: headerHeight,
        color: Colors.blue,
        child: Header());
  }

  _body() {
    return Container(
      width: sized.width,
      height: sized.height - headerHeight,
      child: showMenu
          ? Row(
              children: [
                _menu(),
                _content(),
              ],
            )
          : _content(),
    );
  }

  _menu() {
    return Container(width: menuWidth, color: Colors.grey[200], child: Menu());
  }

  _content() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.yellow,
      child: Container(
        width: showMenu ? sized.width - (menuWidth + 16) : sized.width,
        //child: Body(),
        child: Consumer<AppModel>(builder: (_, app, __) {
          print("Consumer");
          return app.page;
        }),
      ),
    );
  }
}
