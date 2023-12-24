import 'package:flutter/material.dart';

class SmoothRectangle extends StatelessWidget {
  double topRatio;
  Color? color;
  SmoothRectangle({Key? key, required this.topRatio, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      left: screenWidth * 0.12,
      top: screenHeight * topRatio,
      width: screenWidth * 0.75,
      child: Container(
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: color?.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10), // set the desired radius of the corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // set the shadow color
              spreadRadius: 3, // set the shadow spread radius
              blurRadius: 7, // set the shadow blur radius
              offset: const Offset(0, 3), // set the shadow offset
            ),
          ],
        ),
      ),
    );
  }
}
