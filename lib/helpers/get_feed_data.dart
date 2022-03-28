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
    List categories = [];

    rss.findAllElements('item')
        .forEach((node) {
      articles.add({

        'title': node
            .findElements('title')
            .first
            .text,
        'link': node
            .findElements('link')
            .first
            .text,
        'image': node
            .findElements('description')
            .first
            .text,
        'pubDate': node
            .findElements('pubDate')
            .first
            .text,
        'category': node
            .findElements('category')
            .first
            .text,
        /*'author': node
            .findElements('author')
            .single
            .text,*/
      });
    });


    return articles;
  }

  Future<List> readCategoryList(Uri url) async {
    http.Client client = http.Client();
    dynamic data = await client.get(url);
    xml.XmlDocument rss = xml.XmlDocument.parse(data.body);

    List categories =[];

    rss.findAllElements('item')
        .forEach((node) {
      categories.add({

        'category': node
            .findElements('category')
            .first
            .text,

      });
    });
    var distinctCategories = [...{...categories}];
    return distinctCategories;
  }
}