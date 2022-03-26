import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


import 'usuario_model.dart';

class UsuarioRepository {
  Future<void> salvar(UsuarioModel usuario) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var col = firestore.collection("usuarios");
    var doc = await col.doc(usuario.id).get();
    if (doc.exists) {
      await col.doc(usuario.id).update(usuario.toJson());
    } else {
      await col.doc(usuario.id).set(usuario.toJson());
    }

    if (usuario.foto!=null) {
      var filename = usuario.id!+".jpg";
      var ref = FirebaseStorage.instance.ref(filename);
      await ref.putData(base64Decode(usuario.foto!));
      var url = await ref.getDownloadURL();
      await col.doc(usuario.id).update({'foto':url});
    }

  }
  Future<void> sair() async {
   await FirebaseAuth.instance.signOut();
  }
}
