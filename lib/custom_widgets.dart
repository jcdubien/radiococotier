import 'package:flutter/material.dart';
import 'package:radiocotier2/screens/culture_view.dart';

import 'package:radiocotier2/screens/sport_view.dart';
import 'package:radiocotier2/screens/guyane_view.dart';
import '../constants.dart';


class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    int selectedindex = 0;

    return BottomNavigationBar(

      currentIndex: selectedindex,

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

  const BottomButton(this.titleButton, this.icone,this.linkScreen  );

  final String titleButton;
  final IconData icone;
  final Widget linkScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: const Color(0XFF18785D).withOpacity(0.8),
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
        label: Text(titleButton,style:const TextStyle(fontSize: 8.0)),
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


    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(



        padding: EdgeInsets.zero,

        children: [
          /*DrawerHeader(


            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,



            ),

            child: Center(
                child: Opacity(opacity: 0.5,child: Image.asset('assets/RCheader.png')),
            ),
          ),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,

            children:  const [

              SizedBox(height: 50.0),


              DrawerIcon(
                icon: Icons.sports,
                title: 'RC SPORTS',
                destination: SportScreen(),
              ),
              DrawerIcon(
                  icon: Icons.music_note,
                  title: 'RC CULTURE - AN BA FEY',
                  destination: CultureScreen(),
              ),
              DrawerIcon(
                icon: Icons.sunny,
                title: 'RC GUYANE',
                destination: GuyaneScreen(),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    required this.icon,
    required this.title,
    required this.destination,

    Key? key,
  }) : super(key: key);
  final String title;
  final Widget destination;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  20.0),
      child: ListTile(
        title:  Text(title,style: kDrawerMenuStyle),
        leading: Icon(icon,color: Colors.white),

        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination,));
          //Navigator.pop(context);
        },
      ),
    );
  }
}