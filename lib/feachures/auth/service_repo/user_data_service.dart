import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';

final userDataServiceProvider = Provider(
  (ref) => UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataService({
    required this.auth,
    required this.firestore,
  });

  addUserDataToFireStore({
    required String displayName,
    required String email,
    required String userName,
    required String profilePic,
    required String description,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      email: email,
      userName: userName,
      profilePic: profilePic,
      uid: auth.currentUser!.uid,
      type: "user",
      description: description,
      videos: 0,
      subcriptions: [],
    );

    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }

  Future<UserModel> getCurrentUserData() async {
    final currentUser =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    UserModel user = UserModel.fromMap(currentUser.data()!);
    return user;
  }

  Future<UserModel> getAnyUserData(uid) async {
    final currentUser = await firestore.collection("users").doc(uid).get();
    UserModel user = UserModel.fromMap(currentUser.data()!);
    return user;
  }
}
