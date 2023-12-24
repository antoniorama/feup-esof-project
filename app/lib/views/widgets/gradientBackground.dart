import 'package:flutter/material.dart';

class GradientBackground extends StatefulWidget {
  final double? screenHeight;
  const GradientBackground({Key? key, required this.screenHeight}) : super(key: key);

  @override
  State<GradientBackground> createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -7),
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(225, 20, 20, 0.2),
            Color.fromRGBO(99, 138, 236, 0.69),
          ],
        ),
      ),
    );
  }
}
