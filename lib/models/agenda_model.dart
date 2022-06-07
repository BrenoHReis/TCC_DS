import 'package:tcc/models/quadra_model.dart';

class AgendaModel {
  QuadraModel quadra;
  DateTime horario;
  int? id;

  AgendaModel(this.quadra, this.horario, {this.id});

  Map<String, dynamic> toJson() {
    return {
      "quadra": quadra.toJson(),
      "horario": horario,
      "id": id,
    };
  }

  factory AgendaModel.fromMap(Map<String, dynamic> map) {
    return AgendaModel(QuadraModel.fromMap(map['quadra']), map['horario'],
        id: map['id']);
  }
}
