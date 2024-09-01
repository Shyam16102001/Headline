import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headline/constants.dart';
import 'package:headline/screen/home_page/components/body.dart';
import 'package:headline/size_config.dart';
import 'package:jiffy/jiffy.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String date = Jiffy.now().format(pattern: "MMMM dd, yyyy");
  String day = Jiffy.now().format(pattern: "EEEE");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth >= 820) ? largeScreen() : smallScreen();
  }

  Scaffold largeScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  date,
                  style: const TextStyle(fontFamily: "NotoSerif", fontSize: 18),
                ),
                Text(
                  day,
                  style: const TextStyle(
                      fontFamily: "NotoSerif",
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/icon.svg", height: 60),
                SizedBox(width: getProportionateScreenWidth(3)),
                const Text(appName),
                const SizedBox(width: 60)
              ],
            ),
            Image.asset("assets/icons/shyam.png", height: 50),
            // SvgPicture.asset("assets/icons/shyam.svg", height: 50)
          ],
        ),
      ),
      body: const Body(),
    );
  }

  Widget smallScreen() {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(50),
          vertical: getProportionateScreenWidth(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/mobile1.svg",
            height: getProportionateScreenHeight(250),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Align(
            alignment: Alignment.center,
            child: Text(
                "Website is currently available for Large Screen devices only.",
                textAlign: TextAlign.center,
                style: headingStyle),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          const Text("Mobile version of this applicaton is under development.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Poppins")),
          const Text("Visit after some time or open in desktop.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Poppins")),
          SizedBox(height: getProportionateScreenHeight(10)),
        ],
      ),
    )));
  }
}
