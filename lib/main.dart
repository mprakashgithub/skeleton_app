import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/providers/login_provider.dart';
import 'controller/utils/routes/app_router.dart';
import 'view/app_data/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<LoginProvider>(create: (_) => LoginProvider()),
        // ChangeNotifierProvider<LecParamsProvider>(
        //     create: (_) => LecParamsProvider()),
        // ListenableProvider<PendingPhotoProvider>(
        //     create: (_) => PendingPhotoProvider()),
        // ListenableProvider<ReportUploadProvider>(
        //     create: (_) => ReportUploadProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppStrings.routeToSplash,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

///To-Do
///File Structure - Done
///Internationalization -
///Theme : Light and Dark-
///Text Style - Done
///Google fonts - Done
///
 