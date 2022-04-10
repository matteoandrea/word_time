import 'package:http/http.dart';
import "dart:convert";

class WordTime {
  String location;
  String time = "null";
  String urlFlag;
  String urlLocation;

  final String urlWeb = "http://worldtimeapi.org/api/timezone/";

  WordTime(
      {required this.location,
      required this.urlFlag,
      required this.urlLocation});

  Future<void> getCurrentTime() async {
    var url = Uri.parse(urlWeb + urlLocation);
    var response = await get(url);
    var data = jsonDecode(response.body);

    var dateTime = data["datetime"];
    var offset = data["utc_offset"].substring(1, 3);

    var currentTime = DateTime.parse(dateTime);
    currentTime = currentTime.add(Duration(hours: int.parse(offset)));

    time = currentTime.toString();
  }
}
