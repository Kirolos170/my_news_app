import 'package:flutter/material.dart';


import '../model.dart';
class ModelView extends StatelessWidget {
  Model article;
  ModelView(this.article);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Image.network(article.imageUrl.toString(),width: 100,height: 100,),
      title:Text(article.title.toString()) ,
      subtitle:Text(article.subtitle.toString()) ,

    );
  }
}
