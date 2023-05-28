import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from a snapshot
  List<Brew> _brewListFormSnapshot(QuerySnapshot snapshots){
    return snapshots.docs.map((doc) {
      return Brew(
        name: doc['name'] ?? '', 
        strength: doc['strength'] ?? 0,
        sugars: doc['sugars'] ?? '0', 
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid!,
      sugars: snapshot['sugars'],
      strength: snapshot['strength'],
      name: snapshot['name'],
      );
  }

  //get brews stream

  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFormSnapshot);
  }


  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}