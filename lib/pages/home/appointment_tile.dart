import 'package:app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentTile extends StatelessWidget {
  late final dynamic appointment;
  AppointmentTile({required this.appointment});

  @override
  Widget build(BuildContext context) {

    DateTime dateTime = DateTime.parse(appointment['dateAndTime']);
    String time = DateFormat('hh:mm').format(dateTime).toString();
    String date = DateFormat('yyyy-mm-dd').format(dateTime).toString();

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Container(
          height: 40.0,
          child: Icon(Icons.calendar_today_outlined),
        ),
          title: Text(appointment['doctor'], style: TextStyle(fontSize: 18.0),),
          subtitle: Text('Date: $date\nTime: $time', style: TextStyle(fontSize: 15.0),),
        ),
      ),
    );
  }
}
