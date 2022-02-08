import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projeto/input_field.dart';
import 'package:projeto/usuario_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ver = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _inputField("Email", Icons.email, false),
                _inputField("Senha", Icons.password, true),
                SizedBox(
                  height: 20,
                ),
                botaoEntrar(),
                botaoCadastrar(),
                    ],
                  ),
              
            ),
          ),
        );
  }

  _inputField(String rotulo, IconData icone, bool senha){
    return InputField(rotulo, icone, senha);
  }

  botaoEntrar() {
   return Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: () {}, child: Text("Entrar"))),
                  ],
                );
  }

  botaoCadastrar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [Text("Não tem uma conta. "),
      TextButton(onPressed: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsuarioPage() ));
        
   }, child: Text(" Cadastre-se."))
      ],
      ),
    );
    }
}
