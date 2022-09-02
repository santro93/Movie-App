import 'dart:developer';
import 'package:movie_app/model/user.dart' as model;
import 'package:movie_app/utils/constants.dart';

class Authentication {
  static bool signUp({
    required String name,
    required String email,
    required String password,
  }) {
    String result;
    try {
      model.User user =
          model.User(name: name, emailId: email, password: password);
      result = "User Registartaion is Completed Successfullly";
      log(result);
      return true;
    } catch (err) {
      result = err.toString();
      return false;
    }
  }

  static bool signIn({
    required String email,
    required String password,
  }) {
    String result;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        result = "User Logged In Successfullly";

        log("Sign in $isLoggedKey");
      }
      return true;
    } catch (err) {
      result = err.toString();
      return false;
    }
  }
}
