import 'package:evently/core/constant/firebase_exceptions_strings.dart';
import 'package:evently/core/constant/functions/navigation.dart';
import 'package:evently/core/services/shared_prefs.dart';
import 'package:evently/core/utils/ui_utils.dart';
import 'package:evently/future/auth/login/screen/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  static void firebaseCreateAccount({
    required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) async {
    showLoadingDialog(context);
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passController.text,
          );
      User user = credential.user!;
      String? email = user.email ?? '';
      await user.updateDisplayName(nameController.text);
      String? userName = FirebaseAuth.instance.currentUser!.displayName ?? '';
      //cach
      SharedPrefs.setProfileUserData(email: email, userName: userName);
      Navigator.of(context).pop();
      Future.delayed(Duration(seconds: 2), () {
        push(context, LogIn());
      });
      showSnackBarExeption(context, 'registration success');
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == FirebaseExceptionsStrings.weakPassword) {
        showSnackBarExeption(
          context,
          FirebaseExceptionsStrings.weakPasswordMsg,
        );
      } else if (e.code == FirebaseExceptionsStrings.existingEmail) {
        showSnackBarExeption(
          context,
          FirebaseExceptionsStrings.existingEmailMsg,
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
    }
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
