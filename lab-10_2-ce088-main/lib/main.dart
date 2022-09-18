import 'package:flutter/material.dart';
import 'package:sdp_lab_10_1_ce085/pages/choose_location.dart';
import 'package:sdp_lab_10_1_ce085/pages/home.dart';
import 'package:sdp_lab_10_1_ce085/pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/location',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation(),
  },
));