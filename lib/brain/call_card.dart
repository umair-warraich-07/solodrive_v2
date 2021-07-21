import 'package:flutter/cupertino.dart';

class CallCard {
  final String contactName;
  final IconData callIcon;
  final IconData messageIcon;
  final Image contactImage;
  final List<Color> gradientColors;

  CallCard(this.contactName, this.callIcon, this.messageIcon, this.contactImage,
      this.gradientColors);
}
