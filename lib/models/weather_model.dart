import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  String? region;
  CurrentConditions? currentConditions;
  List<NextDay>? nextDays;

  Weather({
    this.region,
    this.currentConditions,
    this.nextDays,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        region: json["region"],
        currentConditions:
            CurrentConditions.fromJson(json["currentConditions"]),
        nextDays: List<NextDay>.from(
            json["next_days"].map((x) => NextDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "currentConditions": currentConditions?.toJson(),
        "next_days": List<dynamic>.from(nextDays!.map((x) => x.toJson())),
      };
}

class CurrentConditions {
  CurrentConditions({
    this.dayhour,
    this.temp,
    this.precip,
    this.humidity,
    this.wind,
    this.iconUrl,
    this.comment,
  });

  String? dayhour;
  Temp? temp;
  String? precip;
  String? humidity;
  Wind? wind;
  String? iconUrl;
  String? comment;

  factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
      CurrentConditions(
        dayhour: json["dayhour"],
        temp: Temp.fromJson(json["temp"]),
        precip: json["precip"],
        humidity: json["humidity"],
        wind: Wind.fromJson(json["wind"]),
        iconUrl: json["iconURL"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "dayhour": dayhour,
        "temp": temp?.toJson(),
        "precip": precip,
        "humidity": humidity,
        "wind": wind?.toJson(),
        "iconURL": iconUrl,
        "comment": comment,
      };
}

class Temp {
  Temp({
    this.c,
    this.f,
  });

  int? c;
  int? f;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        c: json["c"],
        f: json["f"],
      );

  Map<String, dynamic> toJson() => {
        "c": c,
        "f": f,
      };
}

class Wind {
  Wind({
    this.km,
    this.mile,
  });

  int? km;
  int? mile;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        km: json["km"],
        mile: json["mile"],
      );

  Map<String, dynamic> toJson() => {
        "km": km,
        "mile": mile,
      };
}

class NextDay {
  NextDay({
    this.day,
    this.comment,
    this.iconUrl,
    this.maxTemp,
    this.minTemp,
  });

  String? day;
  String? comment;
  String? iconUrl;
  Temp? maxTemp;
  Temp? minTemp;

  factory NextDay.fromJson(Map<String, dynamic> json) => NextDay(
        day: json["day"],
        comment: json["comment"],
        iconUrl: json["iconURL"],
        maxTemp: Temp.fromJson(json["max_temp"]),
        minTemp: Temp.fromJson(json["min_temp"]),
      );

  get iconURL => this.iconUrl;

  Map<String, dynamic> toJson() => {
        "day": day,
        "comment": comment,
        "iconURL": iconUrl,
        "max_temp": maxTemp?.toJson(),
        "min_temp": minTemp?.toJson(),
      };
}
