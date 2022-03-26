import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'view_rss_feed.dart';
import '../constants.dart';
import 'package:radio_coctier/custom_widgets.dart';
import 'package:radio_coctier/helpers/get_feed_data.dart';








class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen ({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen > createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen > {

  bool isAdVisible=true;
  bool isLoading=false;
  late RssFeed rss=RssFeed();


  @override
  void initState() {
    GetFeedData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    getArticles()  {
      var articles =  GetFeedData().readFeed(kUri).toString();
      print(articles);
      return articles;
    }

    return Scaffold(

    body : Column(
      children: [
        const Center(
        child : Text('t',style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ),
        FloatingActionButton.extended(
            onPressed: () {
              getArticles();
            },
            label: Text('Récupérer le flux'),),
      ]
    ));





  }
}
