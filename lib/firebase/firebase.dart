import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:mexpertztest/core/helper.dart';
import 'package:mexpertztest/routes/routes.dart';
import 'package:mexpertztest/widgets/loader.dart';

class Firebase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String userCollection = 'users';
  static String time = DateFormat('jm').format(DateTime.now());
  static String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  static Stream<QuerySnapshot<Object?>> categoryStream =
      firestore.collection('categoryList').snapshots();
  static Stream<QuerySnapshot<Object?>> productStream =
      firestore.collection('productList').snapshots();

  static Future googleLogin() async {
    try {
      Loader().loader();
      UserCredential? userCredential = await signInWithGoogle();
      if (userCredential != null) {
        bool isEmailExistRes =
            await isEmailExist(email: userCredential.user!.email!);
        if (isEmailExistRes) {
          await addUser(
            displayName: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            uid: userCredential.user!.uid,
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            photoURL: userCredential.user!.photoURL ?? '',
            password: '',
          ).then((value) {
            appPrefs.name = userCredential.user!.displayName ?? '';
            appPrefs.isLogin = true;
            Get.offAllNamed(Routes.dashboard);
          });
        } else {
          appPrefs.name = userCredential.user!.displayName ?? '';
          appPrefs.isLogin = true;
          Get.offAllNamed(Routes.dashboard);
        }
      }
    } catch (e) {
      Get.back();
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      return null;
    }
  }

  static Future isEmailExist({required String email}) async {
    var checkEmail = await firestore
        .collection(userCollection)
        .where('email', isEqualTo: email)
        .get();
    return checkEmail.docs.isEmpty;
  }

  static Future addUser(
      {required String uid,
      required String displayName,
      required String email,
      required String password,
      required String photoURL,
      required String phoneNumber}) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    await firestore.collection(userCollection).doc(id).set({
      'id': id,
      'uid': uid,
      'date': date,
      'time': time,
      'name': displayName,
      'email': email,
      'profile': photoURL,
      'phoneNumber': phoneNumber,
      'password': password
    });
  }
}
