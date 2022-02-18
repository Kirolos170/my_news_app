import 'package:flutter/material.dart';

import '../constants.dart';

class ArticleView extends StatelessWidget {
  String imageUrl;
  String title;
  String subtitle;


  ArticleView({required this.imageUrl,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(imageUrl,width: 100,height: 100,),
          Column(
            children: [
              Text(title,style: titlestyle,),
              Text(subtitle,style: subtitlestyle,),
            ],
          ),


        ],
      ),
    );
  }
}
