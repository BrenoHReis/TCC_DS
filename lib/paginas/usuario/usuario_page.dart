
import 'package:flutter/material.dart';
import '../../models/usuario_model.dart';
import 'usuario_form.dart';


class UsuarioPage extends StatelessWidget {
  final UsuarioModel? usuario;
  const UsuarioPage({this.usuario, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Usuário"),
      ),
      body: UsuarioForm(usuario:usuario),
    );
  }
}