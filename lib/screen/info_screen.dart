import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solodrive_v2/widgets/custome_widgets.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: const CustomAppBar(),
          ),
          Center(child: Image.asset('images/car.png')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: const Text(
              'SoLoDrive',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
