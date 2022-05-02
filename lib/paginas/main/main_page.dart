import 'package:flutter/material.dart';
import 'package:tcc/models/categoria_model.dart';
import 'package:tcc/paginas/main/quadra.page.dart';
import 'package:tcc/paginas/usuario/usuario_page.dart';
import 'package:tcc/repositorios/usuario_repository.dart';

import '../../foto_widget.dart';
import '../../models/usuario_model.dart';

class MainPage extends StatelessWidget {
  final UsuarioModel? usuario;
  const MainPage(this.usuario, {Key? key}) : super(key: key);

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quadras Sport"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(255, 39, 38, 38),
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75),
              )
            ]),
            margin: EdgeInsets.all(50),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 250,
                  color:Colors.white,
                ),
                 Container(
                  width: 400,
                  height: 250,
                  color:Colors.white,
                ),
                   Container(
                  width: 400,
                  height: 250,
                  color:Colors.white,
                  ),
                  
                  
              ],
            ),
            ),
          
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: CategoriaModel.categoria
                        .map((e) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              onPressed: () {},
                              child: ListTile(
                                title: Text(e.nome),
                                leading: Icon(e.icone),
                              ),
                            ))
                        .toList(),
                  ),
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
