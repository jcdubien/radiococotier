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
import 'constants.dart';
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

  /*static BannerAd myBanner = BannerAd(
    adUnitId: InterstitialAd.testAdUnitId,
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );*/
  bool isAdVisible=true;
  bool isLoading=false;
  late RssFeed rss=RssFeed();


  @override
  void initState() {
    loadData();

    super.initState();
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
      appBar: AppBar(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Column(
          children: const [
            Text('RadioCocotier',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
            Text('Actualités en Guadeloupe et Martinique', style: TextStyle(fontSize: 14.0),),
          ],
        ),
        actions:<Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0XFF18785D),
                onSurface: Colors.red,
              ),
              onPressed: () => loadData(),
              child: Icon(Ionicons.refresh_circle)),

        ],
        centerTitle: true,
      ),
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,

            ),

            child: Text('Naviguez'),
          ),
          ListTile(
            title: const Text('Item 1'),
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
      ),
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

          ) else Center(child: CircularProgressIndicator(),),

        ],
      ) ,
      bottomNavigationBar:  const CustomBottomAppBar(),

    );
  }
}
