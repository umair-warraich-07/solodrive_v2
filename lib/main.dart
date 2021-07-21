import 'package:flutter/material.dart';
import 'package:solodrive_v2/screen/call_screen.dart';
import 'package:solodrive_v2/screen/favourite_screen.dart';
import 'package:solodrive_v2/screen/home_screen.dart';
import 'package:solodrive_v2/screen/info_screen.dart';
import 'package:solodrive_v2/screen/info_screen3.dart';
import 'package:solodrive_v2/screen/info_screen4.dart';
import 'package:solodrive_v2/screen/info_screen_2.dart';
import 'package:solodrive_v2/screen/map_screen.dart';
import 'package:solodrive_v2/screen/music_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const InformationScreen(),
        '/second': (context) => const InformationScreen2(),
        '/third': (context) => const InformationScreen3(),
        '/forth': (context) => const InformationScreen4(),
        '/five': (context) => const HomeScreen(),
        '/six': (context) => const MapScreen(),
        '/seven': (context) => const CallScreen(),
        '/eight': (context) => const MusicScreen(),
        '/nine': (context) => const FavouriteScreen(),
      },
    );
  }
}
