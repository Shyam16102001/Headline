import 'package:flutter/material.dart';
import 'package:headline/constants.dart';
import 'package:headline/model/article_model.dart';
import 'package:headline/size_config.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget customListTitle(Article article, BuildContext context) {
  void launchURL(String? url) async {
    if (url != null) {
      if (!await launchUrlString(url)) throw 'Could not launch $url';
    }
  }

  Widget imageProvider(String? url) {
    if (url == null || url == "") {
      return Image.asset("assets/images/image_not_found.png",
          height: double.infinity,
          width: getProportionateScreenWidth(65),
          fit: BoxFit.contain);
    } else {
      url = url.substring(0, url.lastIndexOf("&"));
      return Image.network(url,
          height: double.infinity,
          width: getProportionateScreenWidth(65),
          fit: BoxFit.fill);
    }
  }

  return InkWell(
    onTap: () => launchURL(article.url),
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
            child: imageProvider(article.image),
          ),
          SizedBox(
            width: getProportionateScreenWidth(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(article.name?.trimLeft() ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: headingStyle.merge(
                      TextStyle(fontSize: getProportionateScreenHeight(20)),
                    )),
                Text(
                  article.description?.trimLeft() ?? "",
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
