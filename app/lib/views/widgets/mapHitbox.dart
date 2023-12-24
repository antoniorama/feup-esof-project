import 'package:flutter/material.dart';
import 'package:myapp/views/pages/discrict-screen.dart';

class MapHitbox extends StatelessWidget {
  BoxConstraints constraints;
  double xRatio;
  double yRatio;
  double widthRatio;
  double heightRatio;
  int districtId;
  double? opacity;
  Color? color;

  // Constructor
  MapHitbox(
      {Key? key,
      required this.constraints,
      required this.xRatio,
      required this.yRatio,
      required this.widthRatio,
      required this.heightRatio,
      required this.districtId,
      this.opacity = 0.0,
      this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: constraints.maxWidth * xRatio,
      top: constraints.maxHeight * yRatio,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DistrictScreen(id: districtId),
            ),
          );
        },
        child: Container(
          width: constraints.maxWidth * widthRatio,
          height: constraints.maxHeight * heightRatio,
          color: color?.withOpacity(opacity!),
        ),
      ),
    );
  }
}
