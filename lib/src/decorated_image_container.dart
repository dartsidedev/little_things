import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Naming things is hard.
class DecoratedImageContainer extends StatelessWidget {
  const DecoratedImageContainer({Key key, this.child}) : super(key: key);

  final Widget child;

  String _bottomImage(bool light) {
    return light ? 'assets/bottom_img_light.jpg' : 'assets/bottom_img_dark.jpg';
  }

  List<Color> _gradientColors(bool light) {
    if (light) {
      return [
        Color(0xFF96E3FF),
        Color(0xFF9EECFF),
        Color(0xFF9FEBFF),
        Color(0xFF9FEEFF),
        Color(0xFF9FECFF),
      ];
    } else {
      // This shouldn't be a gradient, it's only one color.
      return [
        Color(0xFF010101),
        Color(0xFF010101),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final light = MediaQuery.of(context).platformBrightness == Brightness.light;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _gradientColors(light),
        ),
        image: DecorationImage(
          image: AssetImage(_bottomImage(light)),
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
