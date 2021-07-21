import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solodrive_v2/widgets/custome_widgets.dart';

class InformationScreen4 extends StatefulWidget {
  const InformationScreen4({Key? key}) : super(key: key);

  @override
  _InformationScreen4State createState() => _InformationScreen4State();
}

class _InformationScreen4State extends State<InformationScreen4> {
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
          Center(child: Image.asset('images/dot.png')),
          const Text(
            'Hustle-free driving \n experience',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/five');
              },
              label: const Text('GET STARTED'),
              backgroundColor: const Color(0xff3ABA75),
            ),
          )
        ],
      ),
    );
  }
}
