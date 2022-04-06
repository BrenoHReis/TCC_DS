import 'package:flutter/material.dart';

class CategoriaModel{
  String nome;
  IconData icone;
  int id;
  String image;
  String informacao;
  String foto;

static final categoria = [
      CategoriaModel(1,"Basquete",Icons.sports_basketball,"image/basquete.png", "Quadra com área de estacionamento, bar e área coberta para familia ficar", "image/quadrabasquete.png"),
      CategoriaModel(2,"Futebol",Icons.sports_soccer,"image/society.png", "Quadra do Ocimar Santa Lúcia", "image/quadraocimar.png"),
      CategoriaModel(3,"Vôlei de Praia",Icons.sports_volleyball,"image/voleidepraia.png", "Quadra com área de estacionamento, bar e área coberta para familia ficar", "image/arenabeachsports.png"),
      CategoriaModel(4, "Beach Tênnis", Icons.sports_tennis, "image/beachtennis.png", "Quadra com área de estacionamento, bar e área coberta para familia ficar","image/arenabeachsports.png"),
    ];
  CategoriaModel(this.id,this.nome, this.icone, this.image, this.informacao, this.foto);
  
}