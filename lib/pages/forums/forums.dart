import 'package:app/models/forum.dart';
import 'package:app/pages/forums/forums_list.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/services/auth.dart';

class Forums extends StatefulWidget {
  const Forums({Key? key}) : super(key: key);

  @override
  _ForumsState createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Forum>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').forums,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forums',
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
          child: ForumsList(),
        ),
      ),
    );
  }
}