import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/quadra_model.dart';

class QuadraRepository {
  Future<void> salvar(QuadraModel quadra) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var col = firestore.collection("quadras");
    var doc = await col.doc(quadra.id).get();
    if (doc.exists) {
      await col.doc(quadra.id).update(quadra.toJson());
    } else {
      await col.doc(quadra.id).set(quadra.toJson());
    }

    if (quadra.imagem != null) {
      var filename = quadra.id! + ".jpg";
      var ref = FirebaseStorage.instance.ref(filename);
      await ref.putData(base64Decode(quadra.imagem!));
      var url = await ref.getDownloadURL();
      await col.doc(quadra.id).update({'Imagem': url});
    }
  }

  Future<void> sair() async {
    await FirebaseAuth.instance.signOut();
  }
}
