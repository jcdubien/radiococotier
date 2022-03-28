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

  getArticles() async{
    var articles = await GetFeedData().readFeed(kUri);
    //print(articles);
    return articles;
  }
  getCategories() async {
    var categories = await GetFeedData().readCategoryList(kUri);
    print(categories);
    return categories;
  }

  @override
  initState()  {

    super.initState();
   getArticles();
   getCategories();
  }


  @override
  Widget build (BuildContext context) {

    Future categories = getCategories();
    Future  articles = getArticles();

    return Scaffold(

    body : Column(


      children: [
      FutureBuilder<dynamic>(
      future: categories, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[

            ListTile(
              title: Text('$snapshot.data')
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    )],
    ));
  }
}
