import 'package:dtcc2022/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'usuario_model.dart';

class UsuarioForm extends StatefulWidget {
  const UsuarioForm({Key? key}) : super(key: key);

  @override
  State<UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  UsuarioModel usuario = UsuarioModel();
  @override
  Widget build(BuildContext context) {
    String senha = "";
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
            InputField(
              "Nome",
              Icons.autofps_select_sharp,
              false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode ficar vazio";
                }
              },
              onsaved: (value) {
                usuario.nome = value;
              },
            ),
            InputField(
              "Email",
              Icons.mail,
              false,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return "Informe um email válido";
                }
              },
              onsaved: (value) {
                usuario.email = value;
              },
            ),
            InputField(
              "Senha",
              Icons.password,
              true,
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return "A senha deve ter ao menos 3 caracteres";
                } else {
                  senha = value;
                }
              },
              onsaved: (value) {
                usuario.senha = senha;
              },
            ),
            InputField(
              "Confirmação",
              Icons.add_to_photos_outlined,
              true,
              validator: (value) {
                if (value != senha) {
                  return "Confirmação de senha deve ser igual a senha";
                }
              },
            ),
            Row(children: [
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          salvar(usuario);
                        }
                      },
                      icon: Icon(Icons.save),
                      label: Text("Salvar")))
            ])
          ],
        ),
      ),
    ));
  }

  salvar(UsuarioModel usuario) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usuario.email!, password: usuario.senha!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha informada é muito fácil.');
      } else if (e.code == 'email-already-in-use') {
        print('Email já foi utilizado por outra conta.');
      }
    } catch (e) {
      print(e);
    }
  }
}
