import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc/models/quadra_model.dart';

import '../models/agenda_model.dart';

class AgendaRepository {
  Future<void> salvar(AgendaModel agenda) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var col = firestore.collection("agendas");

    if (agenda.id != null) {
      var doc = await col.doc("${agenda.id}").get();

      await col.doc("${agenda.id}").update(agenda.toJson());
    } else {
      var doc = await col.add(agenda.toJson());
      doc.update({'id': doc.id});
    }
  }

  Future<List<AgendaModel>> listar(QuadraModel quadra, DateTime data) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> col =
        firestore.collection("agendas");
    var query = col.where("agenda.quadra.id", isEqualTo: quadra.id);
    var docs = await query.get();
    return docs.docs.map((e) => AgendaModel.fromMap(e.data())).toList();
  }
}
