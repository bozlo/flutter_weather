import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  final parseWeatherData;
  const WeatherScreen({Key? key, required this.parseWeatherData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  var date = DateTime.now();

  void updateData() {
      temp = widget.parseWeatherData['main']['temp'].round();
      cityName = widget.parseWeatherData['name'];
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
              onPressed:() {},
              icon: Icon(Icons.location_searching)
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 200.0,),
                                Text('Seoul',
                                style: GoogleFonts.lato(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                ),),
                                Row(
                                    children: [
                                      TimerBuilder.periodic(
                                          (Duration(minutes: 1)),
                                          builder: (context) {
                                            print('${getSystemTime()}');
                                            return Text('${getSystemTime()}',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                            ),
                                            );
                                          },
                                        ),
                                      Text(DateFormat(' - EEEE, ').format(date),
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),),
                                      Text(DateFormat('d MMM, yyy').format(date),
                                        style: GoogleFonts.lato(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),),
                                      ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('18\u2103',
                                  style: GoogleFonts.lato(
                                    fontSize: 85.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),),
                                Row(
                                  children: [
                                    SvgPicture.asset('svg/climacon-sun.svg'),
                                    Text(
                                      'Clear sky',
                                        style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10,),
                              Image.asset(
                                'image/bad.png',
                                width: 37.0,
                                height: 35.0,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10,),
                              Text(
                                '174.75',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10,),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10,),
                              Text(
                                '84.03',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10,),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                    ],
                  ),
                ),
               ],
              ),
            ),
          );
      }
}
