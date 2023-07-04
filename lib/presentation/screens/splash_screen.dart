import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:valorant/presentation/screens/home_screen.dart';

import '../widgets/navigate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SplashBody(),
    );
  }
}

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView(context);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
            height: size.height,
            width: size.width,
            margin: EdgeInsets.only(top: size.height*.05),
            // color: Colors.black,
            child: Image.asset(
              "assets/images/splash1.jpg",
              fit: BoxFit.fill,
            )),
        Lottie.asset("assets/lotties/fire-ball.json",
            height: size.height, width: size.width, fit: BoxFit.fill),
        Positioned(
          bottom: size.height*.1,
          left: size.width*.22,
          child: FadeTransition(
            opacity: fadingAnimation!,
            child: Text(
              'Valorant',
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontFamily: 'Valorant',fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  void goToNextView(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      pushRemove(context: context, widget: HomeScreen());
    });
  }
}
