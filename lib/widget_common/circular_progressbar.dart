import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // Set progress color
        backgroundColor: Colors.grey, // Set background color
      ).animatedBox.decelerate.make(); // Expand to fill available space

  }
}
