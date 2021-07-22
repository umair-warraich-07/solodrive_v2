import 'package:flutter/material.dart';

Widget appDrawer() {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 350,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                  ),
                ),
                Image.asset('images/settings.png'),
              ],
            ),
          ),
        ),
        appDrawerButton(text: 'Behavior', iconData: Icons.phone_iphone_sharp),
        appDrawerButton(text: 'Themes', iconData: Icons.wallpaper),
        appDrawerButton(
            text: 'Start up and Exit', iconData: Icons.exit_to_app_sharp),
        appDrawerButton(text: 'Maps', iconData: Icons.location_on),
        appDrawerButton(text: 'Phone', iconData: Icons.call),
        appDrawerButton(text: 'Home', iconData: Icons.home),
        appDrawerButton(text: 'Media', iconData: Icons.headphones),
        appDrawerButton(text: 'Speedometer', iconData: Icons.speed_sharp),
        appDrawerButton(text: 'Voice', iconData: Icons.settings_voice),
        appDrawerButton(text: 'Message', iconData: Icons.message_rounded),
        appDrawerButton(text: 'Landscape', iconData: Icons.open_in_new_off),
        appDrawerButton(text: 'Dark Mode', iconData: Icons.dark_mode),
      ],
    ),
  );
}

class appDrawerButton extends StatelessWidget {
  final String text;
  final IconData iconData;

  appDrawerButton({required this.text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        iconData,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
    );
  }
}
