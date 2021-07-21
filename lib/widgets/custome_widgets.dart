import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: _height / 1.5,
      child: CustomPaint(
        painter: AppBarPainter(),
      ),
    );
  }
}

class AppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    );

    var paint = Paint();
    paint.color = const Color(0xff91DAEA);
    var path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

    const textSpan = TextSpan(
      text: 'Welcome to SoLoDrive',
      style: textStyle,
    );
    var textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height * 0.25 - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  var fillText = Paint();

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xff63aa65)
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 10;
    //list of points
    var points = [
      const Offset(50, 50),
      const Offset(380, 175),
      const Offset(200, 175),
      const Offset(150, 105),
      //draw points on canvas
    ];
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.1205187, size.height * -1.917955);
    path_0.cubicTo(
        size.width * 0.06098374,
        size.height * -1.881443,
        size.width * 0.2349294,
        size.height * -1.823253,
        size.width * 0.3974983,
        size.height * -1.711570);
    path_0.cubicTo(
        size.width * 0.5650311,
        size.height * -1.596475,
        size.width * 0.7338858,
        size.height * -1.468765,
        size.width * 0.8362768,
        size.height * -1.260643);
    path_0.cubicTo(
        size.width * 0.9407682,
        size.height * -1.048258,
        size.width * 0.9594983,
        size.height * -0.7900226,
        size.width * 0.9747439,
        size.height * -0.5382670);
    path_0.cubicTo(
        size.width * 0.9910000,
        size.height * -0.2698661,
        size.width * 1.039294,
        size.height * 0.02684882,
        size.width * 0.9279619,
        size.height * 0.2533339);
    path_0.cubicTo(
        size.width * 0.8169412,
        size.height * 0.4791900,
        size.width * 0.5787543,
        size.height * 0.5088733,
        size.width * 0.3977370,
        size.height * 0.6355747);
    path_0.cubicTo(
        size.width * 0.2231751,
        size.height * 0.7577602,
        size.width * 0.07596298,
        size.height * 0.9552715,
        size.width * -0.1205187,
        size.height * 0.9872172);
    path_0.cubicTo(
        size.width * -0.3265993,
        size.height * 1.020729,
        size.width * -0.5385190,
        size.height * 0.9516244,
        size.width * -0.7189377,
        size.height * 0.8171448);
    path_0.cubicTo(
        size.width * -0.8998374,
        size.height * 0.6823122,
        size.width * -1.065758,
        size.height * 0.4851041,
        size.width * -1.137270,
        size.height * 0.2293778);
    path_0.cubicTo(
        size.width * -1.205792,
        size.height * -0.01565122,
        size.width * -1.115692,
        size.height * -0.2783982,
        size.width * -1.097972,
        size.height * -0.5382670);
    path_0.cubicTo(
        size.width * -1.081920,
        size.height * -0.7736742,
        size.width * -1.095024,
        size.height * -1.006602,
        size.width * -1.037716,
        size.height * -1.230747);
    path_0.cubicTo(
        size.width * -0.9711419,
        size.height * -1.491136,
        size.width * -0.9216817,
        size.height * -1.803787,
        size.width * -0.7395121,
        size.height * -1.940281);
    path_0.cubicTo(
        size.width * -0.5573114,
        size.height * -2.076792,
        size.width * -0.3280647,
        size.height * -1.959701,
        size.width * -0.1205187,
        size.height * -1.917955);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff72B4E3).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
