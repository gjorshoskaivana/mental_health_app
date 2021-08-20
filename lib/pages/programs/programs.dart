import 'package:app/models/program.dart';
import 'package:app/pages/programs/programs_list.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Programs extends StatefulWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Program>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').programs,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Programs',
            style: TextStyle(
              fontSize: 25, fontFamily: 'Lato', color: Colors.white,
              letterSpacing: 2.0, fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.indigo[400],
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Log out', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
        body: Center(
          child: ProgramsList(),
        ),
      ),
    );
  }
}