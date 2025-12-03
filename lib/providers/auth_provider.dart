import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_1/controllers/auth_controller.dart';
import 'package:grocery_app_1/utils/helpers/alert_helper.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  ///auth controller abjects
  final AuthController _authController = AuthController();

  // User name TextEditing controller
  final TextEditingController _name = TextEditingController();

  TextEditingController get name => _name;

// Email TextEditing controller
  final TextEditingController _email = TextEditingController();

  TextEditingController get email => _email;

// Password TextEditing controller
  final TextEditingController _password = TextEditingController();

  TextEditingController get password => _password;

  //Bellow validation box's rest of code in"alert_helper.dart"
  //Validate Text Inputs
  bool validateFeilds(BuildContext context) {
    ///First checking if all textfeilds are empty or not
    if (_name.text.isEmpty || _email.text.isEmpty || _password.text.isEmpty) {
      Logger().w("Please fill all the feilds");
      AlertHelper.showAlert(context, "Please fill all the fields ");

      return false;
    } else if (!_email.text.contains("@")) {
      Logger().w("Please enter a valid email");
      AlertHelper.showAlert(context, "Please enter a valid email ");

      return false;
    } else if (_password.text.length > 6) {
      Logger().w("The password must have more that 6 digits");
      AlertHelper.showAlert(
          context, " Please the password must have more that 6 digits");
      return false;
    } else {
      return true;
    }
  }

//Start the sign process
  Future<void> startSignup(BuildContext context) async {
    try {
      //=============validating inputs
      if (validateFeilds(context)) {
        await _authController
            .signupUser(context, _email.text, _password.text)
            .then(
          (value) {
            // ignore: use_build_context_synchronously
            AlertHelper.showAlert(context, "user created succesfully",
                type: DialogType.success);
          },
        );
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
