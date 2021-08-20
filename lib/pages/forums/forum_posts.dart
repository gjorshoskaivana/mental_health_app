import 'package:app/models/forum.dart';
import 'package:app/pages/forums/post_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/user.dart';

class ForumPosts extends StatefulWidget {
  late final Forum forum;
  ForumPosts({required this.forum});

  @override
  _ForumPostsState createState() => _ForumPostsState();
}

class _ForumPostsState extends State<ForumPosts> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    void _showSettingsPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Provider(
                create: (_) => CustomUser(uid: user!.uid),
                child: PostForum(forumId: widget.forum.id,),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.forum.title, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: widget.forum.posts.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(5.0),
                  title: Text(widget.forum.posts[index]['title'], style: TextStyle(color: Colors.indigo[400], fontSize: 25.0, letterSpacing: 1.0),),
                  subtitle: Text(widget.forum.posts[index]['text'], style: TextStyle(color: Colors.grey[700], fontSize: 15.0, letterSpacing: 1.0),),
                )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showSettingsPanel();
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.indigo[400],
      ),
    );
  }
}
