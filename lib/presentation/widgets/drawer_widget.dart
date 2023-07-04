import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant/presentation/widgets/audioplayer_widget.dart';
import 'package:valorant/presentation/widgets/valorant_textstyle.dart';

class DrawerData extends StatelessWidget {
  const DrawerData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Future<void>? _launched;
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }

    return Padding(
        padding: EdgeInsets.fromLTRB(/*size.width*.03*/ 0, 0, 0, 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              size.width<480?
              Container(
                height: size.height * .15,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/top.jpg"),
                        fit: BoxFit.fill)),
              ):Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * .17, size.height * 0.022, 10, 0),
                      child: Text(
                        'Music',
                        style: valorantstyle.copyWith(
                            fontSize: 26, color: Colors.blue),
                      ),
                    ),
                    AudioPlayers()
                  ],
                ),
              ),
              /*Image.asset(
                'assets/images/splash.jpg',
                height: size.height*.2,
              ),*/
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 20, 10, 10),
                child: Text(
                  'Download Game',
                  style:
                      valorantstyle.copyWith(fontSize: 18, color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {
                  _launched = _launchInBrowser(
                      Uri.parse("https://www.valorantpcdownload.com/"));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(right: size.width * .02),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/windows.png"),
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                    Colors.cyan, BlendMode.darken))),
                      ),
                      Text(
                        "For Windows",
                        style: valorantstyle.copyWith(
                            fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                // color: Colors.white54,
              ),
              Divider(
                color: Colors.green,
              ),
              InkWell(
                onTap: () {
                  _launched = _launchInBrowser(
                      Uri.parse("https://www.valorantpcdownload.com/"));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 5, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(right: size.width * .02),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/mac.jpg"),
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                    Colors.cyan, BlendMode.darken))),
                      ),
                      Text(
                        "For Mac",
                        style: valorantstyle.copyWith(
                            fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                // color: Colors.white54,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 25, 10, 10),
                child: Text(
                  'Know Us',
                  style:
                      valorantstyle.copyWith(fontSize: 18, color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {
                  _launched = _launchInBrowser(
                      Uri.parse("https://www.youtube.com/PlayValorant"));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 25,
                        margin: EdgeInsets.only(right: size.width * .02),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/youtube.png"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.cyan, BlendMode.darken))),
                      ),
                      Text(
                        "Youtube",
                        style: valorantstyle.copyWith(
                            fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                // color: Colors.white54,
              ),
              Divider(
                color: Colors.green,
              ),
              InkWell(
                onTap: () {
                  _launched = _launchInBrowser(Uri.parse(
                      "https://www.facebook.com/VALORANTeg/?brand_redir=103808897687593"));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 5, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(right: size.width * .02),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/face.png"),
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                    Colors.cyan, BlendMode.darken))),
                      ),
                      Text(
                        "Facebook",
                        style: valorantstyle.copyWith(
                            fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                // color: Colors.white54,
              ),
              size.width<480?
              Divider(
                color: Colors.green,
              ):Container(),
              size.width<480?InkWell(
                onTap: () {
                  _launched = _launchInBrowser(Uri.parse(
                      "https://www.instagram.com/playvalorantofficial/"));
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 5, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(right: size.width * .02),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Instagram-Icon.png"),
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                    Colors.cyan, BlendMode.darken))),
                      ),
                      Text(
                        "Instagram",
                        style: valorantstyle.copyWith(
                            fontSize: 13, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                // color: Colors.white54,
              ):Container(),
              SizedBox(
                height: size.height * .01,
              ),
              size.width<480?Padding(
                padding: EdgeInsets.fromLTRB(8.0, 25, 10, 0),
                child: Text(
                  'Play Online',
                  style:
                      valorantstyle.copyWith(fontSize: 18, color: Colors.blue),
                ),
              ):Container(),
             size.width<480? InkWell(
                  onTap: () {
                    _launched = _launchInBrowser(Uri.parse(
                        "https://playvalorant.com/en-gb/?gad=1&gclid=Cj0KCQjwho-lBhC_ARIsAMpgMoeqqewDy1sCR08ZNAqh7rAj20vRwetzWKQtjO0l5skKcHQb3_qZemMaApagEALw_wcB&gclsrc=aw.ds"));
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Lottie.asset("assets/lotties/game.json",
                            width: size.width * .4,
                            height: size.height * .2,
                            fit: BoxFit.fill),
                      ),
                      Positioned(
                          bottom: size.height * .03,
                          left: size.width * .116,
                          child: Text(
                            "Let\'s play",
                            style: valorantstyle.copyWith(
                                fontSize: 17, color: Colors.purple),
                          ))
                    ],
                  )):Container(),
              SizedBox(
                height: size.height * .05,
              ),
              size.width<480?
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * .17, size.height * 0.022, 10, 10),
                    child: Text(
                      'Music',
                      style: valorantstyle.copyWith(
                          fontSize: 26, color: Colors.blue),
                    ),
                  ),
                  AudioPlayers()
                ],
              ):Container()
            ]));
  }
}
