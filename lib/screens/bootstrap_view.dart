import 'package:flutter/material.dart';
import '../custom_widgets.dart';

import 'rss_feed.dart';
import 'contact_screen.dart';
import 'about_screen.dart';

import 'package:webfeed/webfeed.dart';
import '../constants.dart';
import 'package:http/http.dart';
import 'last_news.dart';


class Bootstrap extends StatefulWidget {
  const Bootstrap({Key? key}) : super(key: key);

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {
  int _selectedIndex = 1;
  bool isLoading = false;
  late RssFeed rss = RssFeed();
  //final PageController _pageController = PageController(initialPage: 1);

  final screens = [
    //CategoriesScreen(),
    FirstScreen(title: 'Derniers Posts'),
    LastNewsScreen(),
    ContactScreen(),
    AboutScreen(),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      setState(() {
        isLoading = true;
      });
      // This is an open REST API endpoint for testing purposes
      const API = kRssUrl;
      final response = await get(Uri.parse(API));
      late var channel = RssFeed.parse(response.body);

      setState(() {
        rss = channel;
        isLoading = false;
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: SizedBox(
          child: Image.asset(
            'assets/Bleu-alpha3.png',
            fit: BoxFit.cover,
          ),
        ),

        /*title: Column(
          children: const [
            Text('RadioCocotier',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
            Text('Actualités en Guadeloupe et Martinique', style: TextStyle(fontSize: 14.0),),
          ],
        ),*/

        centerTitle: true,
      ),
      drawer: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/FondRecbleu.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const CustomDrawer()),
      body: screens[_selectedIndex],
      /*PageView(

        controller: _pageController,

        children: [

          CategoriesScreen(),
          FirstScreen(title: 'Derniers Posts'),
          ContactScreen(),
          AboutScreen(),

        ],*/

      /*onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;

          });
        }
      ),*/
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (int index) => setState(() {
                _selectedIndex = index;
                /*_pageController.jumpToPage(
                _selectedIndex);*/
              }),
          items: const <BottomNavigationBarItem>[
            /*BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Catégorie',

            ),*/
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Nous contacter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'A propos',
            ),
          ]),
    );
  }
}
