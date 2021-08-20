import 'package:app/models/brew.dart';
import 'package:app/models/doctor.dart';
import 'package:app/models/forum.dart';
import 'package:app/models/program.dart';
import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference programsCollection = FirebaseFirestore.instance.collection('programs');
  final CollectionReference forumsCollection = FirebaseFirestore.instance.collection('forums');
  final CollectionReference doctorsCollection = FirebaseFirestore.instance.collection('doctors');
  final CollectionReference appointmentsCollection = FirebaseFirestore.instance.collection('appointments');
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength
    });
  }

  // brew list from snapshot
  List<Brew>? _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.get('name') ?? '',
          sugars: doc.get('sugars') ?? '0',
          strength: doc.get('strength') ?? 0
      );
    }).toList();
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
        uid: uid,
        sugars: snapshot['sugars'],
        strength: snapshot['strength'],
        name: snapshot['name']
    );
  }

  // get brews stream
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map((q) => _brewListFromSnapshot(q));
  }

  //get user doc stream
  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  // get programs

  List<Program> _programsFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return Program(
          title: e.get('title'), modules: e.get('uris'));
    }).toList();
  }

  Stream<List<Program>> get programs{
    return programsCollection.snapshots().map((p) => _programsFromSnapshot(p));
  }

  // get forums

  List<Forum> _forumsFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return Forum(title: e.get('title'), posts: e.get('posts'), id: e.get('forumid'));
    }).toList();
  }

  Stream<List<Forum>> get forums{
    return forumsCollection.snapshots().map((f) => _forumsFromSnapshot(f));
  }


  // get doctors
  List<Doctor> _doctorsFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      return Doctor(
          name: e.get('name'), types: e.get('types'), aboutMe: e.get('aboutMe'));
    }).toList();
  }

  Stream<List<Doctor>> get doctors{
    return doctorsCollection.snapshots().map((d) => _doctorsFromSnapshot(d));
  }

  //
  Future updateAppointmentData() async{
    return await appointmentsCollection.doc(uid).set({
      'appointments' : []
    });
  }

// get appointments for user
  List<dynamic> _appointmentsFromSnapshot(DocumentSnapshot snapshot){
    return snapshot['appointments'];
  }

  Stream<List<dynamic>> get appointments{
    return appointmentsCollection.doc(uid).snapshots()
        .map(_appointmentsFromSnapshot);
  }

}