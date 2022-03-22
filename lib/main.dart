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
        title: 'Quadras Sports',
        theme: ThemeData(
          colorScheme: 
            ColorScheme.dark(primary: Color.fromARGB(255, 18, 160, 16),
            
            )
            ),
        home: LoginPage());
  }
}
