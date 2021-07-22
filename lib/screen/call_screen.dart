import 'dart:async';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/widgets/app_drawer.dart';

import 'favourite_screen.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'music_screen.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
          Image.asset(
            'images/call.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Favorites',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7D7D)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Rachael Smith',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Lyndsay Faber',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'creRACHions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Contact',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7E7D7D)),
            ),
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Rachael Smith',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Lyndsay Faber',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffEEEEEE),
            height: 75,
            child: Row(
              children: [
                Image.asset('images/contac_image.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'creRACHions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: Color(0xff3CBA54),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Color(0xff0EA8FF),
                  ),
                ),
              ],
            ),
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
          iconData: Icons.music_note_outlined,
          title: "Music",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MusicScreen(),
            ),
          ),
        ),
        TabData(
          iconData: Icons.favorite,
          title: "Favourite",
          onclick: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FavouriteScreen(),
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
