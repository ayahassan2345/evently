import 'package:evently/core/constant/firebase_exceptions_strings.dart';
import 'package:evently/core/constant/functions/navigation.dart';
import 'package:evently/core/services/firebase/firebase_auth_provider.dart';
import 'package:evently/core/utils/ui_utils.dart';
import 'package:evently/future/tabs/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  static Future<void> createAccountRepository({
    required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passController,
  }) async {
    showLoadingDialog(context);
    try {
      FirebaseAuthProvider.createuser(
        nameController: nameController,
        emailController: emailController,
        passController: passController,
      );
      Navigator.of(context).pop();
      Future.delayed(Duration(seconds: 2), () {
        push(context, Tabs());
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
}
