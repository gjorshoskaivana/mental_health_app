import 'package:app/models/forum.dart';
import 'package:app/pages/forums/forum_posts.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  late final Forum forum;
  ForumTile({required this.forum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Container(
            height: 40.0,
            child: Icon(Icons.forum),
          ),
          title: Text(forum.title, style: TextStyle(color: Colors.indigo[400], fontSize: 25.0),),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForumPosts(forum: forum))
            );
          },
        ),
      ),
    );
  }
}