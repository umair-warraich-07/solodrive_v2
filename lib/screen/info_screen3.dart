import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solodrive_v2/screen/info_screen4.dart';
import 'package:solodrive_v2/widgets/custome_widgets.dart';

class InformationScreen3 extends StatefulWidget {
  const InformationScreen3({Key? key}) : super(key: key);

  @override
  _InformationScreen3State createState() => _InformationScreen3State();
}

class _InformationScreen3State extends State<InformationScreen3> {
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
          Center(child: Image.asset('images/voice.png')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          const Center(
            child: Text(
              'Control everything with voice commands',
              textAlign: TextAlign.center,
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InformationScreen4(),
            ),
          );
        },
        label: const Text('Skip'),
      ),
    );
  }
}
