import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors_code.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double _value = 0;
  int _timeValue = 20;
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/six');
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/seven');
      } else if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/nine');
      }
    });
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'images/musicImage.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
        // onTap: _onItemTapped,
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
