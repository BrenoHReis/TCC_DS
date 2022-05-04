class QuadraModel {
  String? id;
  String? nome;
  String? descricao;
  String? endereco;
  String? bairro;
  int? numero;
  String? cidade;
  String? imagem;
  String? telefone;

  QuadraModel(
      {this.id,
      this.nome,
      this.descricao,
      this.endereco,
      this.bairro,
      this.cidade,
      this.numero,
      this.imagem,
      this.telefone});

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "Descrição": descricao,
      "endereço": endereco,
      "Bairro": bairro,
      "número": numero,
      "cidade": cidade,
      "imagem": imagem,
      "telefone": telefone
    };
  }
}
