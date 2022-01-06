import 'package:flutter/material.dart';
import 'package:headline/constants.dart';
import 'package:headline/model/article_model.dart';
import 'package:headline/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customListTitle(Article article, BuildContext context) {
  void _launchURL(String? url) async {
    if (url != null) {
      if (!await launch(url)) throw 'Could not launch $url';
    }
  }

  Widget imageProvider(String? url) {
    try {
      return Image.network(url!,
          height: double.infinity,
          width: getProportionateScreenWidth(65),
          fit: BoxFit.fill);
    } catch (e) {
      return Image.asset("assets/images/image_not_found.png",
          height: double.infinity,
          width: getProportionateScreenWidth(65),
          fit: BoxFit.contain);
    }
  }

  return InkWell(
    onTap: () => _launchURL(article.url),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1)),
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1)),
      width: getProportionateScreenWidth(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: double.infinity,
            width: getProportionateScreenWidth(65),
            child: imageProvider(article.urlToImage),
          ),
          SizedBox(
            width: getProportionateScreenWidth(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(article.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: headingStyle.merge(
                      TextStyle(fontSize: getProportionateScreenHeight(20)),
                    )),
                Text(
                  article.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
