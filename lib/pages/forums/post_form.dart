import 'package:app/models/forum.dart';
import 'package:app/models/user.dart';
import 'package:app/services/database.dart';
import 'package:app/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostForum extends StatefulWidget {
  final String forumId;
  PostForum({required this.forumId});

  @override
  _PostForumState createState() => _PostForumState();
}

class _PostForumState extends State<PostForum> {

  final _formKey = GlobalKey<FormState>();

  //form values
  late String _currentTitle = '';
  late String _currentText = '0';
  bool strFlag = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Share a post',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              initialValue: '',
              decoration: textInputDecoration.copyWith(hintText: 'Title'),
              validator: (val) => val!.isEmpty ? 'Please enter a title' : null,
              onChanged: (val) {
                setState(() {
                  _currentTitle = val;
                });
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              maxLength: 240,
              keyboardType: TextInputType.multiline,
              initialValue: '',
              decoration: textInputDecoration.copyWith(hintText: 'Post content'),
              validator: (val) => val!.isEmpty ? 'Please enter post content' : null,
              onChanged: (val) {
                setState(() {
                  _currentText = val;
                });
              },
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.indigo[400]),
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(widget.forumId);
                if(_formKey.currentState!.validate()){
                  ForumPost post = ForumPost(title: _currentTitle, text: _currentText);
                  var temp = {'title' : post.title, 'text': post.text};
                  await DatabaseService(uid: '').forumsCollection
                      .doc(widget.forumId).update({
                    'posts' : FieldValue.arrayUnion([temp])
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
            )
          ],
        )
    );
  }
}
