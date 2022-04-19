import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final parseWeatherData;
  const WeatherScreen({Key? key, required this.parseWeatherData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;

  void updateData() {
      temp = widget.parseWeatherData['main']['temp'].round();
      cityName = widget.parseWeatherData['name'];
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('City Name: $cityName',
              style: TextStyle(
                fontSize: 30.0
              ),),
              SizedBox(height: 20.0,),
              Text('Temperature: $temp',
                style: TextStyle(
                    fontSize: 30.0
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
