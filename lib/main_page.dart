import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc/usuario_repository.dart';
import 'foto_widget.dart';
import 'input_field.dart';

import 'usuario_model.dart';
import 'usuario_page.dart';

class MainPage extends StatelessWidget {
  final UsuarioModel? usuario;
  const MainPage(this.usuario, {Key? key}) : super(key: key);

  get style => null;

  @override
  Widget build(BuildContext context) {
    var categorias = [
      "Basquete",
      "Futsal",
      "Vôlei",
      "Vôlei de Praia",
      "Beach Tênnis",
      "Futebol de Campo",
      "Futebol Society"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Quadras Sports"),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 18, 160, 16),
        elevation: 5,
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                                radius: 55.0,
                                backgroundImage:
                                    FotoUsuario().getFoto(usuario!)),
                            Text(usuario!.nome ?? ""),
                          ],
                        ),
                        Positioned(
                            right: 2,
                            top: 2,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          UsuarioPage(usuario: usuario)));
                                },
                                icon: Icon(Icons.edit))),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: categorias.map((e) => ElevatedButton(
                          style: style,
                          onPressed: () {},
                          child: ListTile(title: Text(e),leading: Icon(Icons.abc),),
                        )).toList()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        UsuarioRepository().sair();
                      },
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
