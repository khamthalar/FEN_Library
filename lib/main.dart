import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fen_timer/pages/login.dart';
import 'package:fen_timer/pages/home.dart';

import 'package:fen_timer/theme/theme_service.dart';
import 'package:fen_timer/theme/themes.dart';
import 'package:fen_timer/shared/logger/logger_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  // runApp(MyApp());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    enableLog: true,
    logWriterCallback: Logger.write,
    initialRoute: AppPages.INITIAL,
    getPages:AppPages.routes,
    theme: Themes().lightTheme,
    darkTheme: Themes().darkTheme,
    themeMode: ThemeService().getThemeMode(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Noto Sans Lao',
        // useMaterial3: true,
        // colorSchemeSeed: Colors.grey,
        primarySwatch: Colors.blueGrey,
      ),
      home: 
      // SplashScreen(),
      StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return Home(user: snapshot.data!, googleSignIn: _googleSignIn);
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}


class AppPages{
  static const INITIAL = Routes.ROOT;
  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => MyApp(),
      children: [],
    ),
  ];
}
abstract class Routes {
  static const ROOT = '/root';
}
