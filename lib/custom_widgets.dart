import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_coctier/constants.dart';
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

    int _selectedindex = 0;

    return BottomNavigationBar(

      currentIndex: _selectedindex,

      //backgroundColor: kPrimaryColor,
      elevation : 8.0,
      type: BottomNavigationBarType.fixed,


      items: const <BottomNavigationBarItem> [


    BottomNavigationBarItem(
    icon: Icon(Icons.contact_page),
    label: 'Contact',
      tooltip:'Nous contacter',
      backgroundColor: kPrimaryColor,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.contact_page),
    label: 'Home',
    tooltip:'Accueil',
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

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(


      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(


          decoration: const BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.rectangle,



          ),

          child: Center(
              child: Image.asset('assets/RCheader.png'),
          ),
        ),
        ListTile(
          title: const Text('Catégories', style: TextStyle(color: Colors.black)),

          leading: const Icon(Icons.category),
          tileColor: Colors.blueGrey,



          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Emissions'),
          leading: Icon(Icons.youtube_searched_for),
          tileColor: Colors.white,
          onTap: () {
            // Update the state of the app.
            // ...
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Recrutement'),
          leading: Icon(Icons.work),
          tileColor: Colors.white,
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