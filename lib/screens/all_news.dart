import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_news_app/components/article_model.dart';

import 'package:http/http.dart' as http;

import '../model.dart';
class AllNews extends StatefulWidget {

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<Model> modelist = [];

  late List articlesmap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: FetchData(),
      builder:(context,snapshot){

        if(snapshot.connectionState==ConnectionState.done)
        {

          return ListView.separated(itemBuilder: (context, index) {
            return ModelView(modelist[index]);
          }

            ,
            itemCount: modelist.length,
            separatorBuilder: (context,index)
            {

              return Container(
                width: 1,
                height: 1,
                color: Colors.black,

              );

            },


          );


        }
        else
        {

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              CircularProgressIndicator(),
              Text("Loadind...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)

            ],
          );

        }


      } ,







    );



  }

  FetchData()async{

    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=a69be4eff8314f55bf480827ece40645"));
    var json = jsonDecode(response.body);
    articlesmap=json["articles"];

    for(int i =0;i< articlesmap.length;i++) {
      Model model1 = Model(imageUrl: articlesmap[i]["urlToImage"].toString(),
          title: articlesmap[i]["title"].toString(),
          subtitle: articlesmap[i]["description"].toString());

      modelist.add(model1);


    }

  }

  @override
  void initState() {
    FetchData();
  }
}