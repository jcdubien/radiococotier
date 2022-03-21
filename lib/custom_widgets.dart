import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_coctier/screens/constants.dart';
import 'package:radio_coctier/screens/rss_feed.dart';
import 'screens/vidéos.dart';
import 'screens/rss_feed.dart';
import 'package:flutter_launcher_icons/constants.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    int _selectedindex = 4;

    return BottomNavigationBar(

      currentIndex: _selectedindex,

      //backgroundColor: kPrimaryColor,
      elevation : 8.0,
      type: BottomNavigationBarType.fixed,


      items: const <BottomNavigationBarItem> [

    BottomNavigationBarItem(

        icon: Icon(Icons.home),
        label: 'Accueil',
      backgroundColor: kPrimaryColor,
      tooltip: 'Accueil',

      ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Categories',
      tooltip: 'Catégories',
      backgroundColor: kCategoryColor
      //backgroundColor: kPrimaryColor,
      ),
    BottomNavigationBarItem(
    icon: Icon(Icons.youtube_searched_for),
    label: 'Emissions',
      tooltip: 'Emissions',
      backgroundColor: kVideosColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.looks),
    label: 'Recrutement',
      tooltip:'Recrutement',
      backgroundColor: kRecruitColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.contact_page),
    label: 'Contact',
      tooltip:'Nous contacter',
      backgroundColor: kContactColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.contact_mail),
    label: 'A propos',
      tooltip : 'A propose de l équipe de developpement',
      backgroundColor: kDigitalisColor,
      //backgroundColor: kPrimaryColor,
    ),
    ],

        );/*BottomAppBar(
      elevation: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BottomButton('',Icons.home, const FirstScreen(title: 'Home')),
          BottomButton('',Icons.category,const FirstScreen(title: 'Home')),
          BottomButton('',Icons.youtube_searched_for, const VideosScreen()),
          BottomButton('',Icons.work,const FirstScreen(title: 'Home')),
          BottomButton('',Icons.contact_page,const FirstScreen(title: 'Home')),
          BottomButton('',Icons.contact_mail,const FirstScreen(title: 'Home')),
        ],
      ),
    );*/
  }
}

class BottomButton extends StatelessWidget {

  BottomButton(this.titleButton, this.icone,this.linkScreen  );

  final String titleButton;
  final IconData icone;
  final Widget linkScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Color(0XFF18785D).withOpacity(0.8),
            onSurface: Colors.red,
            elevation: 8.0,
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            )),
        icon: Icon(icone),
        onPressed: ()=>{
          Navigator.push(
              context,
              MaterialPageRoute(builder:
              (context) => linkScreen,
              ))
        },
        label: Text(titleButton,style:TextStyle(fontSize: 8.0)),
    );

  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(

          decoration: BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.rectangle,



          ),

          child: Center(
              child: Image.asset('assets/RCheader.png')
          ),
        ),
        ListTile(
          title: const Text('Item 1', style: TextStyle(color: Colors.black)),

          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}