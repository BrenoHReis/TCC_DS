import 'package:flutter/material.dart';
import 'package:tcc/models/info_model.dart';

class QuadraInfo extends StatelessWidget {
  final InfoModel _infoModel;
  const QuadraInfo(this._infoModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_infoModel.nome),
      ),
    );
  }
}