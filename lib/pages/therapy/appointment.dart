import 'package:app/models/doctor.dart';
import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentForm extends StatefulWidget {
  late final Doctor doctor;
  AppointmentForm({required this.doctor});

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  late String _doctor = widget.doctor.name;
  late DateTime _dateTime = DateTime.now();

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
                      'Make an Appointment',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0,),
                    DateTimeField(
                      decoration: textInputDecoration,
                      format: DateFormat('yyyy-MM-dd HH:mm'),
                      onShowPicker: (context,  val) async {
                        final date = await showDatePicker(
                            context: context,
                            initialDate: _dateTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2022)
                        );
                        if(date != null){
                          final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(_dateTime)
                          );
                          _dateTime = DateTimeField.combine(date, time);
                        }
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.indigo[400]),
                      child: Text(
                        'Make Appointment',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          Appointment post = Appointment(doctor: _doctor, dateAndTime: _dateTime.toString());
                          var temp = {'doctor' : post.doctor, 'dateAndTime' : post.dateAndTime};
                          await DatabaseService(uid: user.uid).appointmentsCollection
                              .doc(user.uid).update({
                            'appointments' : FieldValue.arrayUnion([temp])
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/app');
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


class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2022));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}