import 'package:evently/core/services/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthProvider {
  static Future<void> createuser({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
    User user = credential.user!;
    user.updateDisplayName(nameController.text);
    String? email = user.email ?? ' ';
    String? userName = FirebaseAuth.instance.currentUser!.displayName ?? '';
    String uid = user.uid;
    SharedPrefs.setUserData(uid: uid, email: email, userName: userName);

  }

  static void firebaseSignIn({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) async {
    // showLoadingDialog(context);
    // try {
    //   UserCredential credential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(
    //         email: emailController.text,
    //         password: passController.text,
    //       );
    //   log(credential.toString());

    //   // Navigator.of(context).pop();
    //   // Future.delayed(Duration(seconds: 2), () {
    //   //   push(context, Home());
    //   // });
    //   // showSnackBarExeption(context, 'login success');
    // } on FirebaseAuthException catch (e) {
    //   // Navigator.of(context).pop();
    //   if (e.code == FirebaseExceptionsStrings.userNotFound) {
    //     print('userNotFoundMsg');
    //     // showSnackBarExeption(context, FirebaseExceptionsStrings.userNotFoundMsg);
    //   } else if (e.code == FirebaseExceptionsStrings.wrongPassword) {
    //     print('wrongPasswordMsg');
    //     // showSnackBarExeption(context, FirebaseExceptionsStrings.wrongPasswordMsg);
    //   }
    // } catch (e) {
    //   print(e);
    // }
    // Navigator.of(context).pop();
  }
}
