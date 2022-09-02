import 'package:flutter/material.dart';
import 'package:weather_forecast_flutter/data/api_constants.dart';
import 'package:weather_forecast_flutter/data/api_service.dart';
import 'package:weather_forecast_flutter/models/weather_model.dart';
import 'package:weather_forecast_flutter/screens/weather_app/weather_app_home_screen.dart';
import 'package:weather_forecast_flutter/widgets/autocomplete_basic.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  Weather weatherData = Weather(region: "");
  late FToast fToast;
  var isLoading = false;
  var isWeatherDataReady = false;
  var isTappedInput = false;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("Server error! Showing demo page..."),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          bottom: false,
          child: isLoading
              ? (!isWeatherDataReady
                  ? const Center(
                      child: Text(
                        "Loading",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : WeatherAppHomeScreen(
                      weatherData: weatherData,
                      changeisWeatherDataReady: changeisWeatherDataReady,
                    ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: !isTappedInput ? 100 : 0),
                    Image.asset('assets/weather_app/symbol.png',
                        width: !isTappedInput ? 100 : 0,
                        height: !isTappedInput ? 100 : 0),
                    SizedBox(height: !isTappedInput ? 40 : 0),
                    AutoComplete(
                      notifyParent: refresh,
                      notifyParent2: inputFieldToTop,
                    ),
                    // const SizedBox(height: 5),
                    // const Text("Type and choose your location"),
                  ],
                )),
    );
  }

  void getWeatherData(city) async {
    var weatherFuture = (await ApiService().getWeather(city));
    if (weatherFuture != null) {
      setState(() {
        weatherData = weatherFuture!;
        isWeatherDataReady = true;
      });
    } else {
      _showToast();
      print("home getWeatherData else: ");
      Weather _model = weatherFromJson(ApiConstants.errorCondition);
      weatherFuture = _model;
      setState(() {
        weatherData = weatherFuture!;
        isWeatherDataReady = true;
      });
    }
  }

  void refresh(dynamic childvalue) {
    setState(() {
      weatherData.region = childvalue;
      getWeatherData(childvalue);
      isLoading = true;
    });
  }

  void inputFieldToTop() {
    setState(() {
      isTappedInput = true;
    });
  }

  void changeisWeatherDataReady(dynamic childvalue) {
    setState(() {
      isLoading = false;
      isWeatherDataReady = false;
    });
  }

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
