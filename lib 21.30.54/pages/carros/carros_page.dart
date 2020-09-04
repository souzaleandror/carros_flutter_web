import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:carros_flutter_web/pages/carros/carros_api.dart';
import 'package:carros_flutter_web/web/web_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'carro_page.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Carro>>(
        future: CarrosApi.getCarros(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Carro> carros = snapshot.data;

          return _listView(carros);
        },
      ),
    );
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
      itemCount: carros.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = size(
              constraints.maxWidth * 0.07,
              min: 8,
              max: Theme.of(context).textTheme.body1.fontSize,
            );

            Carro c = carros[index];

            return InkWell(
              onTap: _onClickTap(c),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(c.urlFoto ??
                        "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                    Text(
                      c.nome ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: fontSize),
                    )
                  ],
                ),
              ),
            );
          },
        );
        ;
      },
    );
  }

  _onClickTap(Carro c) {
    //push(context, CarroPage(c));

    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.push(CarroPage(c));
  }
}
