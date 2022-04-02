import 'package:flutter/material.dart';

class CategoriaModel{
  String nome;
  IconData icone;
  int id;
  String image;
static final categoria = [
      CategoriaModel(1,"Basquete",Icons.sports_basketball,"image/basquete.png"),
      CategoriaModel(2,"Futebol",Icons.sports_soccer,"image/society.png"),
      CategoriaModel(3,"Vôlei de Praia",Icons.sports_volleyball,"image/voleidepraia.png"),
      CategoriaModel(4, "Beach Tênnis", Icons.sports_tennis, "image/beachtennis.png"),
    ];
  CategoriaModel(this.id,this.nome, this.icone, this.image);
  
}