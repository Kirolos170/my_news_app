import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_news_app/components/article_model.dart';

import '../model.dart';
class SportNews extends StatefulWidget {
  const SportNews({Key? key}) : super(key: key);

  @override
  State<SportNews> createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  late  List maplist=[];
  List<Model> modellist = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Fetchsportnews(),


        builder: (context,snapshot)
        {

          if(snapshot.connectionState==ConnectionState.done)
          {


            return ListView.separated(itemBuilder: (context,index)
            {

              return ModelView(modellist[index]);


            }
                ,




                separatorBuilder: (context,index)

                {

                  return Container(
                    width: 1,
                    height: 1,
                    color: Colors.black,

                  );


                }


                , itemCount: modellist.length);



          }

          else{

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

        }


    );
  }

  Fetchsportnews()async
  {

    var response =  await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=a69be4eff8314f55bf480827ece40645&category=sport"));
    var json = jsonDecode(response.body);
    maplist = json["articles"];
    for(int i =0; i<maplist.length;i++)
    {
      Model model1 = Model(imageUrl: maplist[i]["urlToImage"].toString()
          , title: maplist[i]["title"].toString(),
          subtitle: maplist[i]["description"].toString());
      modellist.add(model1);
    }








  }

  @override
  void initState() {
//
    Fetchsportnews();

  }
}
