import 'package:app/models/doctor.dart';
import 'package:app/pages/therapy/doctor_details.dart';
import 'package:flutter/material.dart';

class DoctorTile extends StatelessWidget {
  late final Doctor doctor;
  DoctorTile({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Container(
          height: 50.0,
          child: Icon(Icons.person),
        ),
          title: Text(doctor.name, style: TextStyle(color: Colors.indigo[400], fontSize: 20.0),),
          subtitle: Text(doctor.types, style: TextStyle(color: Colors.grey[700], fontSize: 18.0),),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetails(doctor: doctor))
            );
          },
        ),
      ),
    );
  }
}
