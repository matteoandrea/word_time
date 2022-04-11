import 'package:flutter/material.dart';
import 'package:word_time/pages/home_page.dart';
import 'package:word_time/pages/loading_page.dart';
import 'package:word_time/pages/location_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const LoadingPage(),
      "/home": (context) => const HomePage(),
      "/location": (context) => const LocationPage()
    },
  ));
}
