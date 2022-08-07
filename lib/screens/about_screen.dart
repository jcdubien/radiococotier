import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ListView(
        children: const [
          LinkTreeButton(
              url: 'https://instagram.com/radiococotier?igshid=1t3z8pz6vs125',
              logo:'instagram.png',
              text:'instagram'
          ),
          LinkTreeButton(
              url: 'https://twitter.com/radiococotier?s=21',
              logo:'twitter.png',
              text:'twitter'
          ),
          LinkTreeButton(
              url: 'https://chat.whatsapp.com/GVDpkBrx8JK9ynN22dLS5R',
              logo:'whatsapp.png',
              text:'whatsapp'
          ),
          LinkTreeButton(
              url: 'https://t.me/radiococotier',
              logo:'telegram.png',
              text:'telegram'
          ),
          LinkTreeButton(
              url: 'http://radiococotier.fr',
              logo:'Logo vert.jpeg',
              text:'notre site'
          ),

        TextPanel(text :  "Notre réseau d'information couvre la Martinique , "
            "la Guadeloupe , la Guyane , et rassemble une "
            "communauté de passionnés au sein d'un maillage cohérent "
            "de rédacteurs , graphistes , designers , journalistes ,"
            " editorialistes , codeurs , et plus encore , au service des "
            "populations de nos trois territoires ",),
        TextPanel(text: "Nos équipes sont basées dans chaque territoire ,"
    "avec pour chacun d'entre eux , des déclinaisons sportives, "
    "culturelles, pour être au plus proche de vos attentes ,"
    "en temps réel "),


        ],

    ));
  }
}

class TextPanel extends StatelessWidget {
  const TextPanel({required this.text ,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
               //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  8.0, // Move to right 10  horizontally
                  8.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ),
    );
  }
}

class LinkTreeButton extends StatelessWidget {
  const LinkTreeButton({
    Key? key, required this.url, required this.logo, required this.text,
  }) : super(key: key);
  final String url;
  final String logo;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Image.asset(
              'assets/$logo',
              height: 30.0,
              width: 30.0,
            ),
            const SizedBox(width: 10.0),
            Text('Suivez nous sur ${text.toUpperCase()}'),
          ],
        ),
        onTap:(){launch(url) ;
          }
      ),
    );
  }
}
