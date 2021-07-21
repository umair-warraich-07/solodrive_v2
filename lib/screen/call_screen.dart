import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/brain/call_card.dart';
import '../colors_code.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int _selectedIndex = 2;
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
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/six');
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
            Image.asset(
              'images/call.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Favourite',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF444974),
              ),
            ),
            Expanded(
              child: ListView(
                children: _favourite.map((_favourite) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _favourite.gradientColors,
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
                                SizedBox(width: 8),
                                Text(
                                  '${_favourite.contactName}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          _favourite.callIcon,
                          size: 36,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              _favourite.messageIcon,
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
            const Text(
              'Contact',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF444974),
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

List<CallCard> _favourite = [
  CallCard('Umair Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sea),
  CallCard('Shoaib Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sky),
  CallCard('Hassan Ali', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sunset),
  CallCard('Umair Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sea),
  CallCard('Shoaib Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sky),
  CallCard('Hassan Ali', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sunset),
  CallCard('Umair Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sea),
  CallCard('Shoaib Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sky),
  CallCard('Hassan Ali', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sunset),
  CallCard('Umair Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sea),
  CallCard('Shoaib Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sky),
  CallCard('Hassan Ali', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sunset),
  CallCard('Umair Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sea),
  CallCard('Shoaib Sajid', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sky),
  CallCard('Hassan Ali', Icons.call, Icons.message_outlined,
      Image.asset('images/call.png'), GradientColors.sunset),
];
