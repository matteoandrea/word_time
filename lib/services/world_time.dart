import 'package:http/http.dart';
import "dart:convert";
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String urlFlag;
  String urlLocation;

  String time = "null";
  bool isDayTime = false;

  final String urlWeb = "http://worldtimeapi.org/api/timezone/";

  WorldTime(
      {required this.location,
      required this.urlFlag,
      required this.urlLocation});

  Future<void> getCurrentTime() async {
    var url = Uri.parse(urlWeb + urlLocation);

    try {
      var response = await get(url);
      var data = jsonDecode(response.body);

      var dateTime = data["datetime"];
      var offset = data["utc_offset"].substring(1, 3);

      var currentTime = DateTime.parse(dateTime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));

      isDayTime = currentTime.hour >= 6 && currentTime.hour < 20;

      time = DateFormat.jm().format(currentTime);
    } catch (e) {
      time = "not possible to get time data";
    }
  }
}
