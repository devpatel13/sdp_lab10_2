import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                TextButton.icon(

                  onPressed: ()
                  {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.location_on_sharp,size: 40,color: Colors.black,),
                  label:const Text("Edit Location",style: TextStyle(fontSize: 25,color: Colors.black),),
                )
              ],
            ),
          )
      ),
    );
  }
}
