import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:valorant/presentation/screens/home_screen.dart';

import '../widgets/navigate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Container(
      child: Column(
        children: [
          Spacer(),
          FadeTransition(
            opacity: fadingAnimation!,
            child: Text(
              'Valorant',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          Lottie.asset("assets/lotties/fire-ball.json", height: 500),
          /*     Image.asset(
            '${AppConstants.splash_image}',
            fit: BoxFit.cover,
            height: 300,
          ),*/
          Spacer(),
        ],
      ),
    );
  }

  void goToNextView(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
     push(context: context,widget: HomeScreen());
    });
  }
}
