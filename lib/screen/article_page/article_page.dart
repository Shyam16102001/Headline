import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title as String),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: article.urlToImage != null
                          ? NetworkImage(article.urlToImage as String)
                          : const AssetImage(
                                  'assets/images/image_not_found.png')
                              as ImageProvider,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                article.source.name as String,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    article.description ?? article.title as String,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
