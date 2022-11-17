import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  late final String? uid;
  DataBaseServices({this.uid});
  // collection reference
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffee');

  Future updateUserData(String name, String sugars, int strength) async {
    return await coffeeCollection.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }
}
