import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'rss_feed.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radio_coctier/custom_widgets.dart';
import 'bootstrap_view.dart';

class ViewRssScreen extends StatefulWidget {
  final  RssFeed;
  ViewRssScreen({Key? key, required this.RssFeed}) : super(key: key);


  @override
  State<ViewRssScreen> createState() => _ViewRssScreenState(this.RssFeed);
}

class _ViewRssScreenState extends State<ViewRssScreen> {
  final RssFeed;
  _ViewRssScreenState(this.RssFeed);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Ionicons.arrow_back),
          onPressed: ()=> Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => Bootsrap(),
              )
          ),
        ),
        title: Text(RssFeed['title']),
        centerTitle: true,
      ),

      body:Stack(
        children: [
          Container(
              child: ListView(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(RssFeed['image']),
                          fit: BoxFit.fitWidth,
                        ),
                        color: Colors.black12
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(RssFeed['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Ionicons.time_outline),
                      Text(DateFormat('MMM dd').format(
                          DateTime.parse(
                              RssFeed['pubDate'].toString()))),
                      Spacer(),
                      Icon(Ionicons.person_outline),
                      Text(RssFeed['author'])
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton.icon(onPressed:() => launch(RssFeed['link']),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF18785D),
                          onSurface: Colors.red,
                        ),
                        icon: Icon(Ionicons.link),
                        label: Text('Voir sur RadioCocotier.fr')),
                  ),
                  SizedBox(height: 15,),
                  Html(
                    data: RssFeed['content'],
                  )
                ],
              )
          )

        ],
      ) ,
      bottomNavigationBar:  const CustomBottomAppBar(),
    );
  }
}