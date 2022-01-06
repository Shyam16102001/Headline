import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headline/constants.dart';
import 'package:headline/size_config.dart';

import 'components/body.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // leading:
        // leadingWidth: getProportionateScreenWidth(25),
        title: Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(5)),
            SvgPicture.asset(
              "assets/icons/icon.svg",
              height: 60,
            ),
            SizedBox(width: getProportionateScreenWidth(5)),
            Text(appName),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
