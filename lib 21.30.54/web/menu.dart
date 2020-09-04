import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/item_menu.dart';
import 'package:carros_flutter_web/pages/carros/carros_page.dart';
import 'package:carros_flutter_web/pages/default_page.dart';
import 'package:carros_flutter_web/pages/usuarios_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selected;
  List<ItemMenu> menus = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menus.add(ItemMenu("Home2", FontAwesomeIcons.home, DefaultPage()));
    menus.add(ItemMenu("Carros2", FontAwesomeIcons.car, CarrosPage()));
    menus.add(ItemMenu("Usuarios2", FontAwesomeIcons.user, UsuariosPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            _itemMenu('home', FontAwesomeIcons.home, DefaultPage()),
            _itemMenu('carros', FontAwesomeIcons.car, CarrosPage()),
            _itemMenu('Usuarios', FontAwesomeIcons.user, UsuariosPage()),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: menus.length,
            itemBuilder: (context, index) {
              ItemMenu item = menus[index];
              return _itemMenu2(item);
            }),
      ],
    );
  }

  _itemMenu(String title, IconData icon, Widget page) {
    bool b = title == selected;

    return Material(
      color: b ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.push(page);

          setState(() {
            this.selected = title;
          });
        },
        child: ListTile(
          title: Text(
            "$title",
            style: TextStyle(
              fontWeight: b ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          leading: Icon(
            icon,
            color: b ? Colors.black87 : Colors.black26,
          ),
        ),
      ),
    );
  }

  _itemMenu2(ItemMenu item) {
    bool b = item.title == selected;

    return Material(
      color: b ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.push(item.page);

          setState(() {
            this.selected = item.title;
          });
        },
        child: ListTile(
          title: Text(
            "${item.title}",
            style: TextStyle(
              fontWeight: b ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          leading: Icon(
            item.icon,
            color: b ? Colors.black87 : Colors.black26,
          ),
        ),
      ),
    );
  }
}
