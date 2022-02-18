

import 'package:flutter/material.dart';
import 'package:my_news_app/screens/sport_news.dart';


import 'package:http/http.dart' as http;

import '../model.dart';
import 'all_news.dart';
import 'business_new.dart';


class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<Model> modelist = [];
  late List articlesmap;

  int index = 0;
  List<Widget> body = [AllNews(),SportNews(),BusinessNews()];
  List<String> appbar = ["All News" , "Sport News" , "Business News"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(


        title: Text("${appbar[index]}"),
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: (value){
          setState(() {
            index = value;
          });

        },

        currentIndex: index,

        items: [

          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Sport",icon: Icon(Icons.sports_basketball)),
          BottomNavigationBarItem(label: "Business",icon: Icon(Icons.monetization_on_sharp)),


        ],


      ),
      body: body[index],
    );
  }




}
