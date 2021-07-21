import 'dart:async';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/brain/distance_card.dart';
import 'package:solodrive_v2/colors_code.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Map',
      style: optionStyle,
    ),
    Text(
      'Index 2: Call',
      style: optionStyle,
    ),
    Text(
      'Index 3: Music',
      style: optionStyle,
    ),
    Text(
      'Index 4: Star',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/seven');
      } else if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/eight');
      } else if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/nine');
      }
    });
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
        automaticallyImplyLeading: false,
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
      body: DottedBorder(
        strokeWidth: 3,
        color: CustomColors.clockOutline,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        child: Column(
          children: <Widget>[
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
            Container(
              color: Colors.white,
              child: const ClipOval(
                child: SpeedView(),
              ),
            ),
            Expanded(
              child: ListView(
                children: _distanceCard.map((_distanceCard) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _distanceCard.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${_distanceCard.distance}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${_distanceCard.turnDescription}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_distanceCard.description}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              _distanceCard.iconData,
                              size: 36,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xff111010),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: Color(0xFF444974),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
            backgroundColor: Color(0xFF2D2F41),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Music',
            backgroundColor: Color(0xFF242634),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Star',
            backgroundColor: Color(0xFF402840),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff888787),
        onTap: _onItemTapped,
      ),
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

class SpeedView extends StatefulWidget {
  const SpeedView({Key? key}) : super(key: key);

  @override
  State<SpeedView> createState() => _SpeedViewState();
}

class _SpeedViewState extends State<SpeedView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: SpeedPainter(),
        ),
      ),
    );
  }
}

class SpeedPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color = const Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;
    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);
    var speedBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    var speedHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var speedHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(speedHandX, speedHandY), speedBrush);
    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

List<DistanceCard> _distanceCard = [
  DistanceCard('Continue 29 NORTH', 1.2, 'Turn Left on 20', GradientColors.sky,
      Icons.keyboard_return_outlined),
  DistanceCard(
      'Umair Sajid', 10.15, 'Called you', GradientColors.sunset, Icons.call),
  DistanceCard(
      'Cloud', 24, 'Punjab Pakistan', GradientColors.fire, Icons.cloud),
];
