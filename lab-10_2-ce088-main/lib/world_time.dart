import 'dart:convert';
import 'package:http/http.dart' as http;

class WordTime {
  String? location;
  String? time;
  String? flag;
  String? url;

  WordTime({this.location, this.time, this.flag, this.url});

  Future<void> getTime() async {
    http.Response response =
    await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map timeData = jsonDecode(response.body);

    String dateTime = timeData['datetime'],
        offset = timeData['utc_offset'],
        offsetHours = offset.substring(1, 3),
        offsetMinutes = offset.substring(4, 6);

    DateTime currenttime = DateTime.parse(dateTime);
    currenttime = currenttime.add(Duration(
        minutes: int.parse(offsetMinutes), hours: int.parse(offsetHours)));
    time = currenttime.toString();
  }
}
