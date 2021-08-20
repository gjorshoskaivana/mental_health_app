import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[400],
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

