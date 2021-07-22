import 'dart:async';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/screen/favourite_screen.dart';
import 'package:solodrive_v2/screen/home_screen.dart';
import 'package:solodrive_v2/widgets/app_drawer.dart';

import 'call_screen.dart';
import 'map_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double _value = 0;
  int _timeValue = 20;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
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
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                          prefixIcon: const Icon(Icons.search,
                              color: Color(0xffF24747)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/musicImage.png',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_down,
                      size: 40,
                    ),
                  ),
                  const Text(
                    'Guns Blazing (feat.Dr. Dre &',
                    style: TextStyle(
                      color: Color(0xffE13D3D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              Text(
                'Eminem - Music To Be Murder By - Side B',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Slider(
                  activeColor: Color(0xffFF5A5A),
                  inactiveColor: Color(0xff5A5353),
                  value: _timeValue.toDouble(),
                  min: 20.0,
                  max: 330.0,
                  label: '$_timeValue dollars',
                  onChanged: (double newValue) {
                    print('$newValue');
                    setState(() {
                      _timeValue = newValue.round();
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()} dollars';
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${_timeValue}'),
                  Text('${_value}'),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.replay_10,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_outlined,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward_10,
                      size: 40,
                    ),
                  ),
                ],
              )
            ],
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
