import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:headline/components/custom_list_title.dart';
import 'package:headline/constants.dart';
import 'package:headline/model/article_model.dart';
import 'package:headline/services/api_service.dart';
import 'package:headline/size_config.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ApiService client = ApiService();
  final ScrollController controller = ScrollController();
  double i = 1;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                topStoriesSection(articles!),
                latestNewsSection(articles)
              ],
            ),
          );
        }
        return spinner();
      },
    );
  }

  void _launchURL(String? url) async {
    if (url != null) {
      if (!await launchUrlString(url)) throw 'Could not launch $url';
    }
  }

  void navigator() => controller.animateTo(getProportionateScreenWidth(i),
      duration: kAnimationDuration, curve: Curves.ease);

  Center spinner() {
    return const Center(
      child: SpinKitFoldingCube(
        color: kSecondaryTextColor,
        size: 75.0,
      ),
    );
  }

  Widget imageProvider(String? url, double size) {
    if (url == null || url == "") {
      return Image.asset("assets/images/image_not_found.png",
          height: getProportionateScreenHeight(size),
          width: double.maxFinite,
          fit: BoxFit.contain);
    } else {
      url = url.substring(0, url.lastIndexOf("&"));
      return Image.network(url,
          height: getProportionateScreenHeight(size),
          width: double.maxFinite,
          fit: BoxFit.fill);
    }
  }

  Container latestNewsSection(List<Article> articles) {
    return Container(
      height: getProportionateScreenHeight(180),
      width: double.infinity,
      margin: EdgeInsets.only(left: getProportionateScreenWidth(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Latest News",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(22.5),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                    textAlign: TextAlign.left,
                  )),
              Row(
                children: [
                  IconButton(
                    splashRadius: getProportionateScreenHeight(22.5),
                    onPressed: () {
                      setState(() {
                        i = (i >= 152.5) ? i - 152.5 : 0;
                      });
                      navigator();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: getProportionateScreenWidth(2)),
                  IconButton(
                    splashRadius: getProportionateScreenHeight(22.5),
                    onPressed: () {
                      setState(() {
                        i += 152.5;
                      });
                      navigator();
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                  SizedBox(width: getProportionateScreenWidth(12)),
                ],
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(12)),
              child: const Divider()),
          SizedBox(
            height: getProportionateScreenHeight(110),
            width: double.infinity,
            child: Scrollbar(
              controller: controller,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: ListView.builder(
                controller: controller,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: articles.length - 4,
                itemBuilder: (context, index) =>
                    customListTitle(articles[index + 4], context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column topStoriesSection(List<Article> articles) {
    return Column(children: [
      SizedBox(height: getProportionateScreenHeight(5)),
      Text(
        "Top Stories",
        style: TextStyle(
            fontSize: getProportionateScreenHeight(30),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"),
      ),
      SizedBox(height: getProportionateScreenHeight(5)),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            largeNewsSection(articles, 0),
            Column(
              children: [
                smallDescriptionSection(articles, 2),
                SizedBox(height: getProportionateScreenHeight(10)),
                smallImageSection(articles, 3),
              ],
            ),
            largeNewsSection(articles, 1),
          ],
        ),
      )
    ]);
  }

  Widget smallImageSection(List<Article> articles, int index) {
    return InkWell(
      onTap: () => _launchURL(articles[index].url),
      child: Container(
        width: getProportionateScreenWidth(110),
        height: getProportionateScreenHeight(220),
        decoration: BoxDecoration(
            color: kSectionColor,
            border: Border.all(
              color: kSectionColor,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(color: kPrimaryColor, blurRadius: 10.0),
            ]),
        child: Column(
          children: [
            imageProvider(articles[index].image, 135),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(8),
                  horizontal: getProportionateScreenWidth(2)),
              child: Column(
                children: [
                  Text(
                    articles[index].name?.trimLeft() ?? "",
                    style: headingStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(articles[index].source ?? "",
                          style: const TextStyle(color: kSecondaryTextColor)),
                      Text(
                        "  |  ${timeDifference(articles[index].publishedAt ?? "")}",
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallDescriptionSection(List<Article> articles, int index) {
    return InkWell(
      onTap: () => _launchURL(articles[index].url),
      child: Container(
        width: getProportionateScreenWidth(110),
        height: getProportionateScreenHeight(220),
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(2)),
        decoration: BoxDecoration(
            color: kSectionColor,
            border: Border.all(color: kSectionColor),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(color: kPrimaryColor, blurRadius: 10.0)
            ]),
        child: Column(
          children: [
            Text(
              articles[index].name?.trimLeft() ?? "",
              style: headingStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              articles[index].description?.trimLeft() ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(articles[index].source ?? "",
                    style: const TextStyle(color: kSecondaryTextColor)),
                Text(
                  "  |  ${timeDifference(articles[index].publishedAt ?? "")}",
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }

  Widget largeNewsSection(List<Article> articles, int index) {
    return InkWell(
      onTap: () => _launchURL(articles[index].url),
      child: Container(
        width: getProportionateScreenWidth(110),
        height: getProportionateScreenHeight(450),
        decoration: BoxDecoration(
            color: kSectionColor,
            border: Border.all(
              color: kSectionColor,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(color: kPrimaryColor, blurRadius: 10.0),
            ]),
        child: Column(
          children: [
            imageProvider(articles[index].image, 220),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(2)),
                child: Column(
                  children: [
                    Text(
                      articles[index].name?.trimLeft() ?? "",
                      style: headingStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      articles[index].description?.trimLeft() ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(articles[index].source ?? "",
                            style: const TextStyle(color: kSecondaryTextColor)),
                        Text(
                          "  |  ${timeDifference(articles[index].publishedAt ?? "")}",
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeDifference(String time) {
    String current = Jiffy().utc().toIso8601String();
    String difference = Jiffy(time).from(current);
    return difference;
  }
}
