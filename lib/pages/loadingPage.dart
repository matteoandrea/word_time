import 'package:flutter/material.dart';
import 'package:word_time/services/wordTime.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void setupWordTime() async {
    var instance = WordTime(
        location: "Berlin",
        urlFlag: "germany.png",
        urlLocation: "Europe/London");

    await instance.getCurrentTime();
    print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading"),
    );
  }
}
