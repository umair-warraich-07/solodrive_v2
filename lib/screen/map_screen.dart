import 'dart:async';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:solodrive_v2/screen/music_screen.dart';
import 'package:solodrive_v2/widgets/app_drawer.dart';

import 'call_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.327980, 73.264846),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(32.327980, 73.264846),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
}
