import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solodrive_v2/widgets/custome_widgets.dart';

class InformationScreen2 extends StatefulWidget {
  const InformationScreen2({Key? key}) : super(key: key);

  @override
  _InformationScreen2State createState() => _InformationScreen2State();
}

class _InformationScreen2State extends State<InformationScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 5,
              child: CustomPaint(
                size: Size(
                    MediaQuery.of(context).size.width,
                    (MediaQuery.of(context).size.width / 1 * 0.7647058823529411)
                        .toDouble()),
                painter: RPSCustomPainter(),
              )),
          Center(child: Image.asset('images/mobile.png')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          const Center(
            child: Text(
              'Reads out your messages automatically',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/third');
          // Add your onPressed code here!
        },
        label: const Text('Skip'),
      ),
    );
  }
}
