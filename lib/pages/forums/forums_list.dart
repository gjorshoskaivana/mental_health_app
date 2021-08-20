import 'package:app/models/forum.dart';
import 'package:app/pages/forums/forum_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ForumsList extends StatefulWidget {
  const ForumsList({Key? key}) : super(key: key);

  @override
  _ForumsListState createState() => _ForumsListState();
}

class _ForumsListState extends State<ForumsList> {
  @override
  Widget build(BuildContext context) {
    final forums= Provider.of<List<Forum>?>(context) ?? [];
    return ListView.builder(
      itemCount: forums.length,
      itemBuilder: (context, index) {
        return ForumTile(forum: forums[index],);
      },
    );
  }
}
