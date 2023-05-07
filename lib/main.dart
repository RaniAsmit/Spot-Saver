import 'package:flutter/material.dart';
import 'package:social/pagess/borrow_login.dart';
import 'package:social/pagess/home_page.dart';
//import 'package:social/pagess/intro_slider.dart';
// import 'package:social/pagess/information.dart';
import 'package:social/pagess/introduction.dart';
import 'package:social/pagess/liquid_swipe.dart';
import 'package:social/pagess/login_Page.dart';
import 'package:social/pagess/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:social/pagess/welcome.dart';
import 'package:social/sevices/firebase_service.dart';
import 'package:social/pagess/liquid_swipe.dart';
// import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<FirebaseService>(
    FirebaseService(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpotSaver',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 195, 238, 235),
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => Welcome(),
        'introduction': (context) => Introduction(),
        'choose': (context) => Choose(),
        // 'intro': (context) => LiquidSwipeDemo(),
        'borrow': (context) => BorrowPage(),
        'register': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
        'home': (context) => HomePgae(),
      },
    );
  }
}
