import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingButton extends StatefulWidget {
  final Function(bool) setState;

  const CustomLoadingButton({Key? key, required this.setState}) : super(key: key);

  @override
  _CustomLoadingButtonState createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

            child: Container(
          padding: EdgeInsets.only(top: 20, right: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: ClipOval(
            child: Lottie.asset(
              'assets/animations/loadingbarfactory.json',
              width: 200, // Adjust the size of the animation
              height: 200, // Adjust the size of the animation
            ),
          ),
        )

      ),
    );
  }
}
