import 'package:flutter/material.dart';

import '../weather_app_theme.dart';

class RunningView extends StatelessWidget {
  const RunningView(
      {required this.animationController, required this.animation, Key? key})
      : super(key: key);

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: WeatherAppTheme.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: WeatherAppTheme.grey.withOpacity(0.4),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: SizedBox(
                                  height: 100,
                                  child: AspectRatio(
                                    aspectRatio: 1.714,
                                    child: Image.asset(
                                        'assets/weather_app/back.png'),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 130,
                                          right: 16,
                                          top: 30,
                                        ),
                                        child: Text(
                                          "Trying to do my best!",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily:
                                                WeatherAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color:
                                                WeatherAppTheme.nearlyDarkBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 130,
                                      bottom: 12,
                                      top: 8,
                                      right: 16,
                                    ),
                                    child: Text(
                                      'Passionate to learn new technologies, and design approaches. ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: WeatherAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.0,
                                        color: WeatherAppTheme.grey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -6,
                        left: 0,
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: Image.asset('assets/weather_app/runner.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
