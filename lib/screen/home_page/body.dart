import 'package:flutter/material.dart';
import 'package:headline/components/custom_list_title.dart';
import 'package:headline/model/article_model.dart';
import 'package:headline/services/api_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ApiService client = ApiService();
  late Future<List<Article>> article;

  @override
  void initState() {
    article = client.getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: article,
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return Center(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    customListTitle(articles[index], context),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
