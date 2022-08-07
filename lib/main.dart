import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../screens/bootstrap_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadioCocotier',
      theme :  ThemeData(
      // UI
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      primaryColor: const Color(0XFF18785D),
      scaffoldBackgroundColor: const Color(0XFFFFFFFF),
      appBarTheme: const AppBarTheme().copyWith(backgroundColor: const Color(0XFFD3D4D6)),
      fontFamily: 'Montserrat',




    ),

      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                //(context) => const FirstScreen(title: 'Derniers posts')
                (context) => const Bootstrap(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0XFF18785D),
        child: const Center(
          child: Image(image: AssetImage('assets/RCheader.png'),
              height: 100,
              fit: BoxFit.cover) ,
        )
    );
  }
}