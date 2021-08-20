import 'package:app/models/doctor.dart';
import 'package:app/pages/therapy/doctors_list.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Psychologists extends StatefulWidget {
  const Psychologists({Key? key}) : super(key: key);

  @override
  _PsychologistsState createState() => _PsychologistsState();
}

class _PsychologistsState extends State<Psychologists> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Doctor>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').doctors,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Therapy',
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
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  'Doctors',
                  style: TextStyle(color: Colors.indigo[400],
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0,),
              Expanded(child: DoctorsList()),
            ],
          ),
        ),
      ),
    );
  }
}