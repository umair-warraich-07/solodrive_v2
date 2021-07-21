import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int _selectedIndex = 4;
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
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/seven');
      } else if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/eight');
      }
      {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset('images/call.png'),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Color(0xff111010),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map_outlined),
      //       label: 'Map',
      //       backgroundColor: Color(0xFF444974),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.call),
      //       label: 'Call',
      //       backgroundColor: Color(0xFF2D2F41),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.headphones),
      //       label: 'Music',
      //       backgroundColor: Color(0xFF242634),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.star),
      //       label: 'Star',
      //       backgroundColor: Color(0xFF402840),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xff888787),
      //   onTap: _onItemTapped,
      //   // onTap: _onItemTapped,
      // ),
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
