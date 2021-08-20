import 'package:app/models/user.dart';
import 'package:app/pages/app.dart';
import 'package:app/pages/forums/forums.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/programs/programs.dart';
import 'package:app/pages/therapy/psychologists.dart';
import 'package:app/pages/wrapper.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<CustomUser?>.value(
    initialData: null,
    catchError: (_, __) => null,
    value: AuthService().user,
    child: MaterialApp(
      title: 'Mental Health App',
      initialRoute: '/',
      routes: {
        '/' : (context) => Wrapper(),
        '/app' : (context) => App(),
        '/home' : (context) => Home(),
        'programs' : (context) => Programs(),
        '/forums' : (context) => Forums(),
        '/therapy' : (context) => Psychologists()
      },
    ),
  ));
}













