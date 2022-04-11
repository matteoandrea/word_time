import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void setupWordTime() async {
    var instance = WorldTime(
        location: "Berlin",
        urlFlag: "germany.png",
        urlLocation: "Europe/Berlin");

    await instance.getCurrentTime();
    Navigator.pushReplacementNamed(
      context,
      "/home",
      arguments: instance,
    );
  }

  @override
  void initState() {
    super.initState();
    setupWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
