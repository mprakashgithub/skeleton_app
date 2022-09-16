import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool isLoaded = false;
  bool isUsernameEmpty = true;
  bool isPasswordEmpty = true;
  String? username, password;
  bool isPasswordVisible = false;

  ///isLoaded
  bool getIsLoaded() {
    return isLoaded;
  }

  void setIsLoaded(bool value) {
    isLoaded = value;
    notifyListeners();
  }

  ///Username
  String? getUsername() {
    return username;
  }

  void setUsername(String value) {
    username = value;
    isUsernameEmpty = false;
    notifyListeners();
  }

  ///Password
  String? getPassword() {
    return password;
  }

  void setPassword(String value) {
    password = value;
    isPasswordEmpty = false;
    notifyListeners();
  }

  bool getPasswordVisible() {
    return isPasswordVisible;
  }

  void setPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
