import 'package:app/models/brew.dart';
import 'package:app/models/doctor.dart';
import 'package:app/models/user.dart';
import 'package:app/pages/home/settings_form.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/pages/home/appointments_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser?>(context);

    void _showSettingsPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Provider(
            create: (_) => CustomUser(uid: user!.uid),
            child: SettingsForm(),
          ),
        );
      });
    }

    return StreamProvider<List<dynamic>?>.value(
      initialData: null,
      value: DatabaseService(uid: user!.uid).appointments,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
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
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                'My appointments',
                style: TextStyle(color: Colors.indigo[400],
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(child: AppointmentsList()),
          ],
        ),
        ),
      );
  }
}

