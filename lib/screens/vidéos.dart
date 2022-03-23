import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import '../constants.dart';
import 'package:http/http.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {

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
      const API = kYoutubeUrl;
      final  response = await get(Uri.parse(API));
      late var channel = RssFeed.parse(response.body);
      setState(() {
        rss=channel;
        isLoading=false;
        print(channel.title!.length);
      });
    } catch (err) {
      rethrow;
    }
  }

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
        title: Column(
          children: const [
            Text('Radio Cocotier',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),
            Text('Nos émissions', style: TextStyle(fontSize: 14.0),),
          ],
        ),


        centerTitle: true,
      ),
      body : Center(
        child: Text('Playlist'),
      )
    );
  }
}
