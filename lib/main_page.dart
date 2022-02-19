import 'package:dtcc2022/usuario_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UsuarioModel? usuario;

autenticacao(){
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('Usuário fez logout!');
      setState(() {
        usuario = null;
      });
    } else {
      print('Usuário fes Login!');
      setState(() {
        usuario = UsuarioModel(id: user.uid, nome: user.displayName, email: user.email);
      });
    }
  });
}

  @override
  void iniState(){
    super.initState();
    autenticacao();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: usuario==null?LoginWidget() : Container());
  }
}