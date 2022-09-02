import 'package:flutter/material.dart';
import 'package:weather_forecast_flutter/models/weather_model.dart';
import 'package:weather_forecast_flutter/screens/weather_app/models/next_days_list_data.dart';

import '../weather_app_theme.dart';
import '../models/next_days_list_data.dart';

class NextDaysView extends StatefulWidget {
  const NextDaysView(
      {required this.mainScreenAnimationController,
      required this.mainScreenAnimation,
      Key? key,
      this.weatherData})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;
  final Weather? weatherData;

  @override
  _NextDaysViewState createState() => _NextDaysViewState();
}

class _NextDaysViewState extends State<NextDaysView>
    with TickerProviderStateMixin {
  List<NextDaysData> nextDaysData = NextDaysData.tabIconsList;

  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: SizedBox(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 16, left: 16),
                itemCount: nextDaysData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      nextDaysData.length > 10 ? 10 : nextDaysData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return MealsView(
                      nextDaysData: nextDaysData[index],
                      animation: animation,
                      animationController: animationController,
                      nextDay: widget.weatherData!.nextDays![index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView(
      {required this.nextDaysData,
      required this.animationController,
      required this.animation,
      this.nextDay,
      Key? key})
      : super(key: key);

  final NextDaysData nextDaysData;
  final AnimationController animationController;
  final Animation<double> animation;
  final NextDay? nextDay;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: SizedBox(
              width: 130,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: nextDaysData.endColor.withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <Color>[
                            nextDaysData.startColor,
                            nextDaysData.endColor
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 16, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nextDay!.day.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: WeatherAppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 0.2,
                                color: WeatherAppTheme.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        nextDay!.comment.toString(),
                                        style: const TextStyle(
                                          fontFamily: WeatherAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          letterSpacing: 0.2,
                                          color: WeatherAppTheme.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  nextDay!.maxTemp!.c.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: WeatherAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    letterSpacing: 0.2,
                                    color: WeatherAppTheme.white,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    " \u2103",
                                    style: TextStyle(
                                      fontFamily: WeatherAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      letterSpacing: 0.2,
                                      color: WeatherAppTheme.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: WeatherAppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 8,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        nextDay!.iconURL.toString(),
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/sunny.png',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
