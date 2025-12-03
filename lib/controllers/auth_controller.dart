import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/utils/helpers/alert_helper.dart';
import 'package:logger/logger.dart';

class AuthController {
  ///  Signup a user function

  Future<void> signupUser(
      BuildContext context, String email, String password) async {
    //this code got from password auth on flutter fire
    try {
      //*********This is the 1st method ********
      // final credential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      //*********This is the 2nd method ********
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (credential) {
          Logger().w(credential);
          if (credential.user != null) {
            Logger().w("User created successfully");
          } else {
            Logger().w("Couldn't create the user");
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        AlertHelper.showAlert(context, e.code);
      }
    } catch (e) {
      if (context.mounted) {
        AlertHelper.showAlert(context, e.toString());
      }
    }
  }
}
