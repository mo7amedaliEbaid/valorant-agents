import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
Widget offlinewidget(BuildContext context){
  Size size=MediaQuery.sizeOf(context);
  return Stack(
    children: [
      Lottie.asset("assets/lotties/hello-guys.json",
          fit: BoxFit.fill, height: size.height, width: size.width),
      Positioned(
          bottom: size.height*.07,
          left:size.width<480? size.width*.12:size.width*.28,
          child: Text(
            'You Are Offline!',
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontFamily: 'Valorant',
                fontWeight: FontWeight.bold),
          ))
    ],
  );
}