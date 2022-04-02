import 'package:flutter/material.dart';
import 'package:tcc/models/categoria_model.dart';

class QuadraPage extends StatelessWidget {
  final CategoriaModel _categoria;
  const QuadraPage(this._categoria,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoria.nome),
      ),
    );
  }
}