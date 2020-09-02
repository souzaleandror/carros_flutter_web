import 'package:flutter/cupertino.dart';

class ItemMenu {
  String title;
  IconData icon;
  Widget page;

  bool selected = false;

  ItemMenu(this.title, this.icon, this.page);
}
