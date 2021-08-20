import 'package:app/pages/programs/program_details.dart';
import 'package:flutter/material.dart';
import 'package:app/models/program.dart';

class ProgramTile extends StatelessWidget {
  late final Program program;
  ProgramTile({required this.program});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Container(
            height: 40.0,
            child: Icon(Icons.multitrack_audio_outlined),
          ),
          title: Text(program.title, style: TextStyle(color: Colors.indigo[400], fontSize: 25.0), ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProgramDetails(program: program))
            );
          },
        ),
      ),
    );
  }
}