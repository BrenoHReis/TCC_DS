import 'package:flutter/material.dart';

class CategoriaModel{
  String nome;
  IconData icone;
  int id;
static final categoria = [
      CategoriaModel(1,"Basquete",Icons.sports_basketball),
      CategoriaModel(2,"Futebol",Icons.sports_soccer),
      CategoriaModel(3,"Vôlei de Praia",Icons.sports_volleyball)
    ];
  CategoriaModel(this.id,this.nome, this.icone);
  
}