import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_coctier/screens/about_screen.dart';
import 'package:radio_coctier/screens/categories_screen.dart';
import 'package:radio_coctier/screens/contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'view_rss_feed.dart';
import '../constants.dart';
import 'package:radio_coctier/custom_widgets.dart';







class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  bool isAdVisible=true;
  bool isLoading=false;
  late RssFeed rss=RssFeed();
  int _selectedIndex=1;



  @override
  void initState() {

    super.initState();
    loadData();
  }



  loadData() async {
    try {
      setState(() {
        isLoading=true;
      });
      // This is an open REST API endpoint for testing purposes
      const API = kRssUrl;
      final  response = await get(Uri.parse(API));
      late var channel = RssFeed.parse(response.body);

      setState(() {
        rss=channel;
        isLoading=false;
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {


    const transitionType=ContainerTransitionType.fadeThrough;

    return Scaffold(


      body:Stack(

        children: [

          if (isLoading==false) ListView.builder(
              itemCount: rss.items!.length,
              itemBuilder: (BuildContext context, index) {
                final item = rss.items![index];
                final feedItems={
                  'title':item.title,
                  'content':item.content!.value,
                  'creator':item.dc!.creator,
                  'image': item.content!.images.toList().first.isEmpty?
                'https://www.radiococotier.fr/wp-content/uploads/2022/02/RadioCocotier-header-dark-mode.png':
                item.content?.images.toList().first,
                  'link':item.link,
                  'pubDate':item.pubDate,
                  'author':item.dc!.creator
                };
                //print(feedItems);
                return Column(
                  children: [
                    InkWell(

                        onTap:() => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder:
                                (context) => ViewRssScreen(RssFeed: feedItems)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading:  Image(image: CachedNetworkImageProvider(item.content!.images.first.toString(),)),
                            title: Text(item.title.toString()),
                            subtitle:Row(
                              children: [
                                const Icon(Ionicons.time_outline),
                                Text(DateFormat('MMM dd').format(
                                    DateTime.parse(
                                        item.pubDate.toString()))),
                                const Spacer(),
                                const Icon(Ionicons.person_outline),
                                Expanded(child: Text(item.dc!.creator.toString())),
                                const SizedBox(height: 20.0),
                              ],
                            ) ,
                          ),
                        )
                    ),
                    Divider(),
                  ],
                );
              }

          ) else const Center(child: CircularProgressIndicator(),),



        ],

      ) ,
     /* bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          onTap : (int index) => setState(() {
            _selectedIndex = index;


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
*/

    );


  }
}
