import 'package:flutter/material.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/location.dart';

const api_key = '04b7fefe125424d469436dee26d10e51';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key');

    var weatherData = await networkHelper.getData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
