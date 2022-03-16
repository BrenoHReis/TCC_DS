import 'package:dtcc2022/usuario_model.dart';
import 'package:flutter/material.dart';
import 'usuario_form.dart';


class UsuarioPage extends StatelessWidget {
  final UsuarioModel? usuario;
  const UsuarioPage({this.usuario, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Usuário"),
<<<<<<< HEAD
=======
        
>>>>>>> 69f35ef5bcb8ec593a04c6c598395dfe811ec231
      ),
      body: UsuarioForm(usuario:usuario),
    );
  }
}