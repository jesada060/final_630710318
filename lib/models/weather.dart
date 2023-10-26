class Weather {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final Map<String, dynamic> condition;

  Weather({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    // Map<String, dynamic> condition = json['condition'];

    return Weather(
      city: json['city'],
      country: json['country'],
      lastUpdated: json['lastUpdated'],
      tempC: double.parse(json['tempC']),
      tempF: double.parse(json['tempF']),
      feelsLikeC: double.parse(json['feelsLikeC']),
      feelsLikeF: double.parse(json['feelsLikeF']),
      windKph: double.parse(json['feelsLikeF']),
      windMph: double.parse(json['feelsLikeF']),
      humidity: double.parse(json['feelsLikeF']),
      uv: json['uv'],
      condition: json['condition'],
    );
  }
}
