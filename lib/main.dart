import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_widget.dart';
import 'firebase_options.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplicativo de revisão',
        theme: ThemeData.dark(),
        home: LoginPage());
  }
}
