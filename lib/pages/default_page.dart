import 'package:carros_flutter_web/web/web_utils.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // return Center(
        //   child: Text(
        //       'Default - ${constraints.maxWidth} / ${constraints.maxHeight}'),
        // );
        return GridView.builder(
            itemCount: 100,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return LayoutBuilder(builder: (context, constraints) {
                double w = size(constraints.maxWidth * 0.08,
                    min: 10,
                    max: Theme.of(context).textTheme.bodyText1.fontSize);

                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 250,
                          maxWidth: 250,
                        ),
                        child: Container(
                          color: Colors.blue,
                          child: Image.network(
                              "data:image/jpeg;base64,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"),
                        ),
                      ),
                      Text(
                        "Renault Megane - ${constraints.maxHeight.toInt()} / ${constraints.maxWidth.toInt()}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: w),
                      )
                    ],
                  ),
                );
              });
            });
      },
    );
  }
}
