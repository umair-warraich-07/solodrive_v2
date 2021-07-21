import 'package:flutter/cupertino.dart';

class DistanceCard {
  final double distance;
  final IconData iconData;
  final String description;
  final String turnDescription;
  final List<Color> gradientColors;

  DistanceCard(this.description, this.distance, this.turnDescription,
      this.gradientColors, this.iconData);
}
