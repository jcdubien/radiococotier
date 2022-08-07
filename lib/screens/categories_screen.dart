
import 'package:flutter/material.dart';


import '../constants.dart';

import '../helpers/get_feed_data.dart';




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

    var categories = getCategories();

    var articles = getArticles();


    return Scaffold(

    body : Column(


      children: [
/*


        if (isLoading==false) ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, index) {
              final item = articles[index];
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


*/

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
    )

      /*Center(
        child:Text('Categories'),
      )],*/
    ]));
  }
}
