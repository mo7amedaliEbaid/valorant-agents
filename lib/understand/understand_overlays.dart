/*
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Slide()));
}

class Indicator extends StatelessWidget {
  Indicator({ Key? key, required this.link, required this.offset }) : super(key: key);

  final LayerLink link;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformFollower(
      offset: offset,
      link: link,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}

class Slide extends StatefulWidget {
  Slide({ Key? key }) : super(key: key);

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  final double indicatorWidth = 24.0;
  final double indicatorHeight = 300.0;
  final double slideHeight = 200.0;
  final double slideWidth = 400.0;

  final LayerLink layerLink = LayerLink();
  late OverlayEntry overlayEntry;
  late Offset indicatorOffset;

  Offset getIndicatorOffset(Offset dragOffset) {
    final double x = (dragOffset.dx - (indicatorWidth / 2.0)).clamp(0.0, slideWidth - indicatorWidth);
    final double y = (slideHeight - indicatorHeight) / 2.0;
    return Offset(x, y);
  }

  void showIndicator(DragStartDetails details) {
    indicatorOffset = getIndicatorOffset(details.localPosition);
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 0.0,
          left: 0.0,
          child: SizedBox(
            width: indicatorWidth,
            height: indicatorHeight,
            child: Indicator(
                offset: indicatorOffset,
                link: layerLink
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }

  void updateIndicator(DragUpdateDetails details) {
    indicatorOffset = getIndicatorOffset(details.localPosition);
    overlayEntry.markNeedsBuild();
  }

  void hideIndicator(DragEndDetails details) {
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overlay Indicator')),
      body: Center(
        child: CompositedTransformTarget(
          link: layerLink,
          child: Container(
            width: slideWidth,
            height: slideHeight,
            color: Colors.blue.withOpacity(0.2),
            child: GestureDetector(
              onPanStart: showIndicator,
              onPanUpdate: updateIndicator,
              onPanEnd: hideIndicator,
            ),
          ),
        ),
      ),
    );
  }
}

*/
