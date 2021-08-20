import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  late String _currentName = 'New name';
  late String _currentSugars = '0';
  late int _currentStrength = 100;
  bool strFlag = true;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData? userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your brew settings',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      initialValue: userData?.name,
                      decoration: textInputDecoration,
                      validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) {
                        setState(() {
                          _currentName = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0,),
                    DropdownButtonFormField(
                      value: userData?.sugars,
                      decoration: textInputDecoration,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _currentSugars = val as String;
                        });
                      },
                    ),
                    Slider(
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      onChanged: (val) {
                        setState(() {
                          _currentStrength = val.round();
                        });
                      },
                      value: ( strFlag ? userData!.strength : _currentStrength).toDouble(),
                      activeColor: Colors.brown[strFlag ? userData!.strength : _currentStrength],
                      inactiveColor: Colors.brown[strFlag ? userData!.strength : _currentStrength],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                      child: Text(
                        'Post',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars,
                              _currentName,
                              _currentStrength);
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                )
            );
          }
          return Loading();
      }
    );
  }
}
