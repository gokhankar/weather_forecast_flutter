import 'package:flutter/material.dart';

import '../weather_app_theme.dart';

class TitleView extends StatelessWidget {
  const TitleView(
      {required this.animationController,
      required this.animation,
      this.titleTxt = '',
      this.subTxt = '',
      Key? key})
      : super(key: key);

  final String titleTxt;
  final String subTxt;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return Material(
          color: WeatherAppTheme.background,
          child: FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: WeatherAppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: WeatherAppTheme.lightText,
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
