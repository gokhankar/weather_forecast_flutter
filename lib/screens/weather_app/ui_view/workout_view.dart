import 'package:flutter/material.dart';

import '../weather_app_theme.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView(
      {required this.animationController, required this.animation, Key? key})
      : super(key: key);

  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: <Color>[
                    WeatherAppTheme.nearlyDarkBlue,
                    Color(0xFF6F56E8)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: WeatherAppTheme.grey.withOpacity(0.6),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Weather Forecast App',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: WeatherAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: WeatherAppTheme.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'This app is a showcase about my Flutter skills',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: WeatherAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            letterSpacing: 0.0,
                            color: WeatherAppTheme.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.timer,
                                color: WeatherAppTheme.white,
                                size: 16,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text(
                                'Next task: Adding night mode',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: WeatherAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  color: WeatherAppTheme.white,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Container(
                              decoration: BoxDecoration(
                                color: WeatherAppTheme.nearlyWhite,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: WeatherAppTheme.nearlyBlack
                                          .withOpacity(0.4),
                                      offset: const Offset(8.0, 8.0),
                                      blurRadius: 8.0),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Color(0xFF6F56E8),
                                  size: 44,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
