import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/route_config/route_constants.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<User?> signinWithPhoneNumber(
      String phoneNumber, BuildContext context) async {
    User? user;
    try {
      _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          user = await _signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {},
        codeSent: (verificationId, forceResendingToken) {
          GoRouter.of(context).pushNamed(RouteConstants.VERIFYOTP,
              pathParameters: {"verificationId": verificationId});
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 5));
    debugPrint("Trying to logout");
  }

  bool checkLogin() {
    return _firebaseAuth.currentUser != null ? true : false;
  }

  Future<User> _signInWithCredential(AuthCredential credential) async {
    UserCredential userCredentail =
        await _firebaseAuth.signInWithCredential(credential);

    return userCredentail.user!;
  }
}
