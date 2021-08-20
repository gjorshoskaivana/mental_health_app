import 'package:app/models/program.dart';
import 'package:app/pages/programs/program_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProgramsList extends StatefulWidget {
  const ProgramsList({Key? key}) : super(key: key);

  @override
  _ProgramsListState createState() => _ProgramsListState();
}

class _ProgramsListState extends State<ProgramsList> {

  @override
  Widget build(BuildContext context) {
    final programs= Provider.of<List<Program>?>(context) ?? [];
    return ListView.builder(
      itemCount: programs.length,
      itemBuilder: (context, index) {
        return ProgramTile(program: programs[index]);
      },
    );
  }
}
