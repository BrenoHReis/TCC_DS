import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_field.dart';

import 'usuario_model.dart';
import 'usuario_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool ver = false;
  UsuarioModel usuario = UsuarioModel();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputField(
                "Email",
                Icons.email,
                false,
                onsaved: (email) => usuario.email = email,
              ),
              InputField(
                "Senha",
                Icons.password,
                true,
                onsaved: (senha) => usuario.senha = senha,
              ),
              SizedBox(
                height: 20,
              ),
              _botaoEntrar(),
              _botaoCadastar(),
            ],
          ),
        ),
      ),
    );
  }

  _botaoEntrar() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  _login();
                },
                child: Text("Entrar"))),
      ],
    );
  }

  _botaoCadastar() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Não tem um conta.    ", style: GoogleFonts.dekko()),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UsuarioPage()));
            },
            child: Text("Cadastre-se"))
      ]),
    );
  }

  Future<void> _login() async {
    _key.currentState!.save();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuario.email!, password: usuario.senha!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Nenhum usuário com este email.');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta.');
      }
    }
  }
}