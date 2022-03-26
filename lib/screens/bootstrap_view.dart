import 'package:flutter/material.dart';
import 'package:radio_coctier/custom_widgets.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'rss_feed.dart';
import'contact_screen.dart';
import 'about_screen.dart';
import 'categories_screen.dart';

class Bootstrap extends StatefulWidget {
  const Bootstrap({Key? key}) : super(key: key);

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {

  int _selectedIndex=1;

  final PageController _pageController = PageController(initialPage: 1);

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

          child: Image.asset('assets/Bleu-alpha3.png',fit: BoxFit.cover,),

        ),
        /*title: Column(
          children: const [
            Text('RadioCocotier',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
            Text('Actualités en Guadeloupe et Martinique', style: TextStyle(fontSize: 14.0),),
          ],
        ),*/

        centerTitle: true,
      ),
      drawer:
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Tel-bleu1.png"),
                fit: BoxFit.cover,
              ),),
          child: const CustomDrawer()),
      body: PageView(

        controller: _pageController,

        children: [

          CategoriesScreen(),
          FirstScreen(title: 'Derniers Posts'),
          ContactScreen(),
          AboutScreen(),

        ],


      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          onTap : (int index) => setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(
                _selectedIndex);

          }),
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem> [

            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Catégorie',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Nous contacter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'A propos',
            ),
          ]

      ),
    );
  }
}
