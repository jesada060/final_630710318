import 'package:final_630710318/repositories/weather_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? _weather;
  String city = 'bangkok';
  bool isCelsius = true;
  var _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    getData(city);
  }

  getData(String city) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 0));

    try {
      var weather = await WeatherRepository().getData(city);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // city = 'bangkok';
                      getData('bangkok');
                    });
                  },
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.grey[300],
                  child: Text('Bangkok'),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // city = 'nakhon pathom';
                      getData('nakhon pathom');
                    });
                  },
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.grey[300],
                  child: Text('Nakhon Pathom'),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // city = 'paris';
                      getData('paris');
                    });
                  },
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.grey[300],
                  child: Text('Paris'),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(_weather?['city']),
              Text(_weather?['country']),
              Text(_weather?['lastUpdated']),
              Image.network(_weather?['condition']['icon']),
              Text(_weather?['condition']['text']),
              isCelsius ? Text('${_weather!['tempC']}')
                        : Text('${_weather!['tempF']}'),
              isCelsius ? Text('Feels like ${_weather!['feelsLikeC']}')
                        : Text('Feels like ${_weather!['feelsLikeF']}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          isCelsius = true;
                        });
                      },
                      child: Text('℃'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          isCelsius = false;
                        });
                      },
                      child: Text('℉'),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(Icons.water_drop),
                      Text('HUMIDITY'),
                      Text('${_weather!['humidity']}%'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(Icons.air),
                      Text('WIND'),
                      isCelsius ? Text('${_weather!['windKph']} km/h')
                                : Text('${_weather!['windMph']} mph'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(Icons.light_mode),
                      Text('UV'),
                      Text('${_weather!['uv']}')
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}