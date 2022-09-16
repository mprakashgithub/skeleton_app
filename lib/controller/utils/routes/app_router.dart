import 'package:flutter/material.dart';

import '../../../view/app_data/app_strings.dart';
import '../../../view/screens/login.dart';
import '../../../view/screens/home.dart';
import '../../../view/screens/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  late Widget pageResult;
  switch (settings.name) {
    case AppStrings.routeToSplash:
      pageResult = const Splash();
      break;
    case AppStrings.routeToLogin:
      pageResult = const Login();
      break;
    case AppStrings.routeToHome:
      pageResult = const Home();
      break;
  }
  debugPrint(pageResult.toString());
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
