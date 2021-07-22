import 'dart:async';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/screen/call_screen.dart';
import 'package:solodrive_v2/screen/favourite_screen.dart';
import 'package:solodrive_v2/screen/map_screen.dart';
import 'package:solodrive_v2/screen/music_screen.dart';
import 'package:solodrive_v2/widgets/app_drawer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 50,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 50,
            endValue: 100,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 100,
            endValue: 150,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10)
      ], pointers: <GaugePointer>[
        NeedlePointer(value: 90)
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                child: const Text('90.0',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 20),
          axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(10),
    );
  }

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
      backgroundColor: Colors.white,
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
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffF24747),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Color(0xffF24747),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('images/google_mic.png'),
                ),
              ],
            ),
            _getGauge(),
            Container(
              color: Color(0xffEEEEEE),
              height: 110,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset('images/left_turn.png'),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '    Continue',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Image.asset('images/state_route.png'),
                      Text(
                        'NORTH',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1.2 mi',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'Turn Left on',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Color(0xffEEEEEE),
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset('images/cloud.png'),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '    Cloudy',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '93/82 F',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Color(0xffEEEEEE),
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset('images/contac_image.png'),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '    Rachael Smith',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/misscall.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Missed call',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: appDrawer(),
      bottomNavigationBar: buildFancyBottomNavigation(context),
    );
  }

  FancyBottomNavigation buildFancyBottomNavigation(BuildContext context) {
    return FancyBottomNavigation(
      circleColor: Color(0xffFDFDFD),
      activeIconColor: Color(0xff3CBA54),
      inactiveIconColor: Color(0xffA4A4A4),
      tabs: [
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
}

