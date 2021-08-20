import 'package:app/pages/app.dart';
import 'package:app/pages/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser?>(context);
    if(user == null){
      return Authenticate();
    } else{
      return App();
    }
    //return either home or authenticate widget

  }
}
