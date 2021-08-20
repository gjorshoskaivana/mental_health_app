import 'package:app/models/doctor.dart';
import 'package:app/pages/therapy/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    final doctors= Provider.of<List<Doctor>?>(context) ?? [];
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorTile(doctor: doctors[index],);
      },
    );
  }
}
