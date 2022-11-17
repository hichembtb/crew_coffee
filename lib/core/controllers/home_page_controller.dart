import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewcoffee/core/widgets/custom_bottom_sheet.dart';
import 'package:crewcoffee/models/connected_user_model.dart';
import 'package:crewcoffee/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  late String currentName;
  late String currentSugars;
  late int currentStrength;

  // ? show setting panel function
  showSettingsPanel(BuildContext context) {
    Get.bottomSheet(const CustomBottomSheet());
  }

  CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffee');
  List<UserModel> userInstance = [];
  List<QueryDocumentSnapshot<Object?>> userDocs = [];
  // get coffe stream from database service
  Future fetchCoffees() async {
    userInstance.clear();
    QuerySnapshot<Object?> coffeeQuery = await coffeeCollection.get();
    userDocs = coffeeQuery.docs;
    for (QueryDocumentSnapshot<Object?> client in userDocs) {
      Map<String, dynamic> clientData = client.data() as Map<String, dynamic>;
      userInstance.add(UserModel.fromMap(clientData));

      update();
    }
  }

  String userUid = FirebaseAuth.instance.currentUser!.uid;
  List<ConnectedUserModel> connectedUserInstance = [];
  Future getConnectedUser() async {
    DocumentSnapshot<Object?> connectedUserQuery =
        await coffeeCollection.doc(userUid).get();
    Map<String, dynamic> clientData =
        connectedUserQuery.data() as Map<String, dynamic>;
    connectedUserInstance.add(ConnectedUserModel.fromMap(clientData));
    currentName = connectedUserInstance.first.name;
    currentSugars = connectedUserInstance.first.sugars;
    currentStrength = connectedUserInstance.first.strength;

    update();
  }

  Function(double)? onChanged(double value) {
    currentStrength = value.round();

    update();
    return null;
  }

  Future writeToDb() async {
    FormState? formdata = formstate.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        coffeeCollection.doc(userUid).update({
          'name': currentName,
          'strength': currentStrength,
          'sugars': currentSugars,
        });
        fetchCoffees();
        Get.back();
      }
    }
  }

  @override
  void onInit() {
    getConnectedUser();
    fetchCoffees();
    super.onInit();
  }
}
