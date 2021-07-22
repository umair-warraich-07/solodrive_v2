import 'dart:async';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/widgets/app_drawer.dart';

import 'call_screen.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'music_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4885ED),
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timeString,
            )
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36,
                  width: 200,
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xffF24747)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_voice_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 40,
            color: const Color(0xffEEEEEE),
            child: Row(
              children: [
                Image.asset('images/facebook.png'),
                SizedBox(
                  width: 50,
                ),
                const Text(
                  'Facebook',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 40,
            color: const Color(0xffEEEEEE),
            child: Row(
              children: [
                Image.asset('images/whatsappicon.png'),
                SizedBox(
                  width: 50,
                ),
                const Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 40,
            color: const Color(0xffEEEEEE),
            child: Row(
              children: [
                Image.asset('images/volumeup.png'),
                SizedBox(
                  width: 50,
                ),
                const Text(
                  'Volume Up',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 40,
            color: const Color(0xffEEEEEE),
            child: Row(
              children: [
                Image.asset('images/volumedown.png'),
                SizedBox(
                  width: 50,
                ),
                const Text(
                  'Volume down',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
        ],
      ),
      drawer: appDrawer(),
      bottomNavigationBar: buildFancyBottomNavigation(context),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  FancyBottomNavigation buildFancyBottomNavigation(BuildContext context) {
    return FancyBottomNavigation(
      circleColor: Color(0xffFDFDFD),
      activeIconColor: Color(0xff3CBA54),
      inactiveIconColor: Color(0xffA4A4A4),
      tabs: [
        TabData(
          iconData: Icons.home,
          title: "Home",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          ),
        ),
        TabData(
          iconData: Icons.map_outlined,
          title: "Map",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapScreen(),
            ),
          ),
        ),
        TabData(
          iconData: Icons.call,
          title: "Call",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CallScreen(),
            ),
          ),
        ),
        TabData(
          iconData: Icons.music_note_outlined,
          title: "Music",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MusicScreen(),
            ),
          ),
        ),
      ],
      key: bottomNavigationKey,
      onTabChangedListener: (position) {
        setState(() {});
      },
    );
  }
}
