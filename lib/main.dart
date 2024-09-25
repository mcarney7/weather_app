import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String cityName = '';
  String weatherCondition = '--';
  String temperature = '--';
  List<Map<String, String>> sevenDayForecast = [];

  void fetchWeather() {
    setState(() {
      Random random = Random();
      temperature = '${15 + random.nextInt(16)}°C';
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      weatherCondition = conditions[random.nextInt(3)];
    });
  }

  void fetch7DayForecast() {
    setState(() {
      sevenDayForecast = List.generate(7, (index) {
        Random random = Random();
        String temp = '${15 + random.nextInt(16)}°C';
        List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
        String condition = conditions[random.nextInt(3)];
        return {
          'day': 'Day ${index + 1}',
          'temperature': temp,
          'condition': condition
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetch7DayForecast,
              child: Text('Fetch 7-Day Forecast'),
            ),
            SizedBox(height: 20),
            Text('City Name: $cityName'),
            Text('Temperature: $temperature'),
            Text('Weather Condition: $weatherCondition'),
            SizedBox(height: 20),
            if (sevenDayForecast.isNotEmpty)
              Column(
                children: sevenDayForecast.map((dayForecast) {
                  return Column(
                    children: [
                      Text('${dayForecast['day']}: ${dayForecast['temperature']} - ${dayForecast['condition']}'),
                      SizedBox(height: 5),
                    ],
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
