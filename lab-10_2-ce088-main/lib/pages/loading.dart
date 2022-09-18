import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    final response = await http.get(
        Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
    print(response.body);

    Map timeData = jsonDecode(response.body);
    print(timeData);
    String dateTime = timeData['datetime'];
    String offset = timeData['utc_offset'];

    print(dateTime);
    print(offset);
    DateTime currentTime = DateTime.parse(dateTime);
    print(currentTime);

    String offsetHours = offset.substring(1, 3);
    print(offsetHours);
    String offsetMinutes = offset.substring(4, 6);
    print(offsetMinutes);

    currentTime = currentTime.add(Duration(
        minutes: int.parse(offsetMinutes), hours: int.parse(offsetHours)));

    print(currentTime);
  }

  String? time = 'LOADING.....';

  void setWorldTime() async {
    WordTime timeInstance =
    WordTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await timeInstance.getTime();
    setState(() {
      time = timeInstance.time;
      print(time);
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('World Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.alarm,
            //       color: Colors.deepPurple,
            //       size: 40,
            //     )),
            const Text("Time for your location",
                style: TextStyle(fontSize: 20, letterSpacing: 2)),
            TextButton(
              child: Text(
                '$time',
                style:
                const TextStyle(wordSpacing: 2, color: Colors.lightGreen),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
    ;
  }
}
