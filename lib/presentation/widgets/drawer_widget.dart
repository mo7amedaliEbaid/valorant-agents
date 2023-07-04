import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant/presentation/widgets/audioplayer_widget.dart';

class DrawerData extends StatelessWidget {
 const DrawerData();
/* Future<void>? _launched;

 Future<void> _launchInWebViewOrVC(Uri url) async {
   if (!await launchUrl(
     url,
     mode: LaunchMode.inAppWebView,
     webViewConfiguration: const WebViewConfiguration(
         headers: <String, String>{'my_header_key': 'my_header_value'}),
   )) {
     throw Exception('Could not launch $url');
   }
 }*/


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Padding(
        padding:  EdgeInsets.fromLTRB(/*size.width*.03*/0, size.height*.02, 0, 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height*.13,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/top.jpg"),fit: BoxFit.fill)
                ),),
              /*Image.asset(
                'assets/images/splash.jpg',
                height: size.height*.2,
              ),*/
              Padding(
                padding:  EdgeInsets.only(top: 18.0),
                child: Text(
                  'Download',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InkWell(
                onTap: (){
                 /* _launched = _launchInWebViewOrVC(
                      Uri.parse("https://www.facebook.com/"));*/
                },
                child: Row(
                  children: [
                    Text("For Windows"),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/mac.jpg"),fit: BoxFit.fill,colorFilter: ColorFilter.mode(Colors.green, BlendMode.darken))
                    ),)
                  ],
                ),
               // color: Colors.white54,
              ),
              Divider(
                color: Colors.white54,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 12),
                    child: InkWell(
                      onTap: () {
                      //  _toggleanimation;
                      },
                      child: Container(
                        height: 20,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Go Home",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white54,
                  ),
                  Container(
                    height: 20,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.share),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Tell a Friend',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(Icons.help_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Help and Feedback',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 400,),
              AudioPlayers()
            ])
    );
  }
}
