import 'package:app/models/brew.dart';
import 'package:app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:app/pages/home/appointment_tile.dart';

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({Key? key}) : super(key: key);

  @override
  _AppointmentsListState createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<List<dynamic>?>(context) ?? [];

    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return AppointmentTile(appointment: appointments[index]);
      },
    );

  }
}
