import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screen/article_page/article_page.dart';

Widget customListTitle(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 3)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: article.urlToImage != null
                        ? NetworkImage(article.urlToImage as String)
                        : const AssetImage('assets/images/image_not_found.png')
                            as ImageProvider,
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(30)),
            child: Text(
              article.source.name as String,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            article.title as String,
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    ),
  );
}
