// Importing the 'dart:math' package to use random number generation for simulating weather data.
import 'dart:math';
// Importing the Flutter Material package, which contains pre-built UI components (like buttons, text fields, etc.)
import 'package:flutter/material.dart';

// The main function is the entry point of the app. It calls the runApp() function, which sets up the widget tree and starts the app.
void main() {
  runApp(WeatherInfoApp());
}

// This class defines the main structure of the app.
// It extends StatelessWidget because it does not manage any mutable state.
class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The MaterialApp widget sets up the basic app structure, like the theme and home page.
    return MaterialApp(
      title: 'Weather Info App', // Title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets a blue color theme for the app
      ),
      home: WeatherHomePage(), // Defines the main screen (home page) of the app.
    );
  }
}

// This is the home page of the app, where the user interacts with the weather info features.
// StatefulWidget is used here because the UI changes based on user input (fetching weather, etc.).
class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

// The State class holds the mutable state of the WeatherHomePage.
// The _WeatherHomePageState class manages the UI updates when the state changes.
class _WeatherHomePageState extends State<WeatherHomePage> {
  // Variables to hold the city name, weather condition, and temperature.
  String cityName = ''; // Stores the name of the city entered by the user.
  String weatherCondition = '--'; // Placeholder for the weather condition.
  String temperature = '--'; // Placeholder for the temperature.

  // This function simulates fetching weather data when the "Fetch Weather" button is pressed.
  void fetchWeather() {
    setState(() {
      // Randomly generate a temperature between 15°C and 30°C.
      Random random = Random(); 
      temperature = '${15 + random.nextInt(16)}°C'; // Random temperature from 15 to 30 degrees.
      
      // Randomly pick a weather condition from a predefined list.
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy']; // Predefined weather conditions.
      weatherCondition = conditions[random.nextInt(3)]; // Randomly select a weather condition.
    });
  }

  // The build method defines the UI layout for the screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides the basic structure of the page, including an app bar and body.
      appBar: AppBar(
        title: Text('Weather Info App'), // The title displayed in the app bar.
      ),
      // Padding adds space around the elements inside the body for better UI spacing.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds 16 pixels of padding to all sides.
        child: Column( // Column arranges its children vertically.
          children: [
            // A TextField widget where users can input the city name.
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter city name', // Placeholder text prompting the user.
                border: OutlineInputBorder(), // Draws a border around the text field.
              ),
              // When the user types in the text field, update the cityName variable.
              onChanged: (value) {
                setState(() {
                  cityName = value; // Store the value of the entered city name.
                });
              },
            ),
            SizedBox(height: 10), // Adds vertical spacing of 10 pixels between the TextField and the button.
            
            // ElevatedButton for fetching weather data.
            // When pressed, it calls the fetchWeather function defined earlier.
            ElevatedButton(
              onPressed: fetchWeather, // When clicked, the fetchWeather function is triggered.
              child: Text('Fetch Weather'), // The label on the button.
            ),
            SizedBox(height: 20), // Adds vertical spacing between the button and the weather information.

            // Display the entered city name, simulated temperature, and weather condition.
            Text('City Name: $cityName'), // Displays the city name entered by the user.
            Text('Temperature: $temperature'), // Displays the simulated temperature.
            Text('Weather Condition: $weatherCondition'), // Displays the simulated weather condition.
          ],
        ),
      ),
    );
  }
}
