import 'package:carros_flutter_web/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;

  Size get sized => MediaQuery.of(context).size;
  bool get showDrawer => sized.width <= hideMenu;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(child: _menu()),
      appBar: AppBar(
        title: Text(
          "Flutter Web - ${size.width} / ${size.height}",
        ),
        centerTitle: true,
        automaticallyImplyLeading: showDrawer,
      ),
      body: _body(),
    );
  }

  _body() {
    return showDrawer
        ? _content()
        : Row(
            children: [
              // 1
              // Container(
              //   width: size.width / 2,
              //   height: size.height,
              //   color: Colors.blue[100],
              // ),
              // Container(
              //   width: size.width / 2,
              //   height: size.height,
              //   color: Colors.grey,
              // ),

              //2
              // Expanded(
              //   flex: 2,
              //   child: Container(color: Colors.blue[100]),
              // ),
              // Expanded(
              //   flex: 8,
              //   child: Container(color: Colors.grey[100]),
              // )

              //3
              // Container(
              //   width: size.width * 0.2,
              //   height: size.height,
              //   color: Colors.blue[100],
              // ),
              // Container(
              //   width: size.width * 0.8,
              //   height: size.height,
              //   color: Colors.grey,
              // ),
              _menu(),
              _content(),
            ],
          );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.blue[100],
      child: ListView(
        children: [
          ListTile(
            title: Text("Item 1"),
            leading: Icon(Icons.star),
          ),
          ListTile(
            title: Text("Item 2"),
            leading: Icon(Icons.star),
          ),
          ListTile(
            title: Text("Item 3"),
            leading: Icon(Icons.star),
          ),
          ListTile(
            title: Text("Item 4"),
            leading: Icon(Icons.star),
          ),
        ],
      ),
    );
  }

  _content() {
    return Container(
      width: showDrawer ? sized.width : sized.width - menuWidth,
      color: Colors.grey,
    );
  }
}
