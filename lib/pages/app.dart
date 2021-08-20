import 'package:app/main.dart';
import 'package:app/pages/forums/forums.dart';
import 'package:app/pages/programs/programs.dart';
import 'package:app/pages/therapy/psychologists.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    Home(),
    Programs(),
    Forums(),
    Psychologists()
  ];


  onItemTapped(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  /*List<String> pages = [
    '/home',
    '/programs',
    '/forums',
    '/therapy'
  ];*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => onItemTapped(index),
        selectedItemColor: Colors.indigo[300],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35.0,),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps, size: 35.0,),
              label: 'Programs',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.forum, size: 35.0,),
              label: 'Forums',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined, size: 35.0,),
              label: 'Therapy',
          ),
        ],
      ),
    );
  }
}
