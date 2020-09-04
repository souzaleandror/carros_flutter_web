import 'package:flutter/material.dart';

class BkpCarrosPage extends StatefulWidget {
  @override
  _BkpCarrosPageState createState() => _BkpCarrosPageState();
}

class _BkpCarrosPageState extends State<BkpCarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text('Carros'),
    );
  }
}
