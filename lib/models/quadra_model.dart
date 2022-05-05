class QuadraModel {
  String? id;
  String? nome;
  String? descricao;
  String? endereco;
  String? bairro;
  int? numero;
  String? cidade;
  String? imagem;
  int? telefone;
  String? categoria;
  String? horaAberto;
  String? horaFecha;

  QuadraModel(
      {this.id,
      this.nome,
      this.descricao,
      this.endereco,
      this.bairro,
      this.cidade,
      this.numero,
      this.imagem,
      this.telefone,
      this.categoria,
      this.horaAberto,
      this.horaFecha});

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "Descrição": descricao,
      "endereço": endereco,
      "Bairro": bairro,
      "número": numero,
      "cidade": cidade,
      "imagem": imagem,
      "telefone": telefone,
      "categoria": categoria,
      "Hora que abre": horaAberto,
      "Hora que fecha": horaFecha
    };
  }
}
