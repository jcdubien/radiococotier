import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/rss_feed.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radio_coctier/screens/bootstrap_view.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadioCocotier',
      theme :  ThemeData(
      // UI
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      primaryColor: Color(0XFF18785D),
      scaffoldBackgroundColor: Color(0XFFFFFFFF),
      appBarTheme: AppBarTheme().copyWith(backgroundColor: const Color(0XFFD3D4D6)),
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
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                //(context) => const FirstScreen(title: 'Derniers posts')
                (context) => const Bootsrap(),
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