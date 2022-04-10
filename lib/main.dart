import 'package:flutter/material.dart';
import 'package:word_time/pages/homePage.dart';
import 'package:word_time/pages/loadingPage.dart';
import 'package:word_time/pages/locationPage.dart';

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
