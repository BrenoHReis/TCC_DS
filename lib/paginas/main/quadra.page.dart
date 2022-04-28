import 'package:flutter/material.dart';
import 'package:tcc/models/categoria_model.dart';
import 'package:tcc/models/info_model.dart';
import 'package:tcc/paginas/main/quadrainfo.dart';

class QuadraPage extends StatelessWidget {
  final CategoriaModel _categoria;
  const QuadraPage(this._categoria, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_categoria.nome),
        ),
        body: Column(
          children: InfoModel.infoModel
              .map((_infoModel) => GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuadraInfo(_infoModel),
                    )),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: (Image.asset(_categoria.foto)),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(_categoria.informacao),
                                ))),
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
