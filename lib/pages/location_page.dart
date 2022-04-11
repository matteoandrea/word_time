import 'package:flutter/material.dart';
import 'package:word_time/services/world_time.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<WorldTime> locations = [
    WorldTime(
        urlLocation: 'Europe/London', location: 'London', urlFlag: 'uk.png'),
    WorldTime(
        urlLocation: 'Europe/Berlin',
        location: 'Athens',
        urlFlag: 'greece.png'),
    WorldTime(
        urlLocation: 'Africa/Cairo', location: 'Cairo', urlFlag: 'egypt.png'),
    WorldTime(
        urlLocation: 'Africa/Nairobi',
        location: 'Nairobi',
        urlFlag: 'kenya.png'),
    WorldTime(
        urlLocation: 'America/Chicago',
        location: 'Chicago',
        urlFlag: 'usa.png'),
    WorldTime(
        urlLocation: 'America/New_York',
        location: 'New York',
        urlFlag: 'usa.png'),
    WorldTime(
        urlLocation: 'Asia/Seoul',
        location: 'Seoul',
        urlFlag: 'south_korea.png'),
    WorldTime(
        urlLocation: 'Asia/Jakarta',
        location: 'Jakarta',
        urlFlag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    var instance = locations[index];
    await instance.getCurrentTime();
    Navigator.pop(
      context,
      instance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/${locations[index].urlFlag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
