import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  var counter = 0;
  @override
  Widget build(BuildContext context) {
    print("BUILD FUNCTION RUN IN CHOOSE LOCATION Counter = $counter");
    return Scaffold(
        appBar: AppBar(
          title: const Text("CHOOSE LOCATION"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text("Counter is $counter"),
              )
            ],
          ),
        ));
  }
}
