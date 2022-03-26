import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class GetFeedData {
  //Uri url = Uri.parse('https://www.radiococotier.fr/feed/');

  Future<List> readFeed(Uri url) async {
    http.Client client = http.Client();
    dynamic data = await client.get(url);
    xml.XmlDocument rss = xml.XmlDocument.parse(data.body);

    List articles = [];

    rss.findAllElements('item')
        .forEach((node) {
      articles.add({

        'title': node
            .findElements('title')
            .single
            .text,
        /*'link': node
            .findElements('link')
            .single
            .text,
        'image': node
            .findElements('image')
            .single
            .text,
        'pubDate': node
            .findElements('pubDate')
            .single
            .text,
        'author': node
            .findElements('author')
            .single
            .text,*/
      });
    });


    return articles ;


  }

}