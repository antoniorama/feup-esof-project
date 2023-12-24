import 'package:flutter/material.dart';
import 'package:myapp/views/pages/discrict-screen.dart';
import 'package:myapp/views/widgets/mapHitbox.dart';

class MapImage extends StatelessWidget {
  const MapImage({super.key});

  @override
  Widget build(BuildContext context) {

    double opacity = 0.0; // testing purposes
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      key: const Key("mapImage"),
      padding: EdgeInsets.only(top: screenHeight * 0.1),
      child:
      Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              // Map Image
              Image.asset(
                'assets/page-1/images/imagemap.png',
                fit: BoxFit.cover,
                width: constraints.maxWidth * 0.86,
                height: constraints.maxHeight * 0.86,
              ),
              // Hitboxes
              // Aveiro (id 1)
              MapHitbox(key: const Key("aveiro"),constraints: constraints, xRatio: 0.3, yRatio: 0.2, widthRatio: 0.1, heightRatio: 0.1, districtId: 1, opacity: opacity, color: Colors.blue),
              // Beja (id 3)
              MapHitbox(constraints: constraints, xRatio: 0.4, yRatio: 0.64, widthRatio: 0.23, heightRatio: 0.12, districtId: 3, opacity: opacity),
              MapHitbox(constraints: constraints, xRatio: 0.27, yRatio: 0.71, widthRatio: 0.3, heightRatio: 0.06, districtId: 3, opacity: opacity),
              // Braga (id 4)
              MapHitbox(constraints: constraints, xRatio: 0.27, yRatio: 0.085, widthRatio: 0.18, heightRatio: 0.055, districtId: 4, opacity: opacity, color: Colors.blue),
              // Bragança (id 5)
              MapHitbox(constraints: constraints, xRatio: 0.6, yRatio: 0.055, widthRatio: 0.18, heightRatio: 0.13, districtId: 5, opacity: opacity, color: Colors.blue),
              // Castelo Branco (id 6)
              MapHitbox(constraints: constraints, xRatio: 0.49, yRatio: 0.3, widthRatio: 0.2, heightRatio: 0.115, districtId: 6, opacity: opacity, color: Colors.blue),
              MapHitbox(constraints: constraints, xRatio: 0.42, yRatio: 0.36, widthRatio: 0.1, heightRatio: 0.05, districtId: 6, opacity: opacity, color: Colors.blue),
              // Coimbra (id 8)
              MapHitbox(constraints: constraints, xRatio: 0.25, yRatio: 0.29, widthRatio: 0.24, heightRatio: 0.07, districtId: 8, opacity: opacity),
              // Faro (id 9)
              MapHitbox(constraints: constraints, xRatio: 0.24, yRatio: 0.77, widthRatio: 0.36, heightRatio: 0.06, districtId: 9, opacity: opacity, color: Colors.blue),
              // Évora (id 10)
              MapHitbox(constraints: constraints, xRatio: 0.4, yRatio: 0.53, widthRatio: 0.22, heightRatio: 0.11, districtId: 10, opacity: opacity, color: Colors.blue),
              MapHitbox(constraints: constraints, xRatio: 0.33, yRatio: 0.55, widthRatio: 0.1, heightRatio: 0.05, districtId: 10, opacity: opacity, color: Colors.blue),
              // Guarda (id 11)
              MapHitbox(constraints: constraints, xRatio: 0.55, yRatio: 0.185, widthRatio: 0.15, heightRatio: 0.12, districtId: 11, opacity: opacity),
              // Portalegre (id 12)
              MapHitbox(constraints: constraints, xRatio: 0.47, yRatio: 0.42, widthRatio: 0.13, heightRatio: 0.11, districtId: 12, opacity: opacity, color: Colors.white),
              MapHitbox(constraints: constraints, xRatio: 0.6, yRatio: 0.47, widthRatio: 0.08, heightRatio: 0.08, districtId: 12, opacity: opacity, color: Colors.white),
              MapHitbox(constraints: constraints, xRatio: 0.4, yRatio: 0.47, widthRatio: 0.08, heightRatio: 0.05, districtId: 12, opacity: opacity, color: Colors.white),
              // Leiria (id 13)
              MapHitbox(constraints: constraints, xRatio: 0.25, yRatio: 0.36, widthRatio: 0.16, heightRatio: 0.04, districtId: 13, opacity: opacity, color: Colors.white),
              MapHitbox(constraints: constraints, xRatio: 0.22, yRatio: 0.4, widthRatio: 0.09, heightRatio: 0.04, districtId: 13, opacity: opacity, color: Colors.white),
              MapHitbox(constraints: constraints, xRatio: 0.16, yRatio: 0.44, widthRatio: 0.09, heightRatio: 0.03, districtId: 13, opacity: opacity, color: Colors.white),
              // Lisboa (id 14)
              MapHitbox(constraints: constraints, xRatio: 0.13, yRatio: 0.47, widthRatio: 0.12, heightRatio: 0.1, districtId: 14, opacity: opacity, color: Colors.blue),
              // Viseu (id 16)
              MapHitbox(constraints: constraints, xRatio: 0.4, yRatio: 0.185, widthRatio: 0.15, heightRatio: 0.11, districtId: 16, opacity: opacity, color: Colors.black),
              // Setubal (id 17)
              MapHitbox(constraints: constraints, xRatio: 0.18, yRatio: 0.57, widthRatio: 0.14, heightRatio: 0.04, districtId: 17, opacity: opacity, color: Colors.white),
              MapHitbox(constraints: constraints, xRatio: 0.25, yRatio: 0.6, widthRatio: 0.14, heightRatio: 0.11, districtId: 17, opacity: opacity, color: Colors.white),
              // Porto (id 18)
              MapHitbox(constraints: constraints, xRatio: 0.28, yRatio: 0.14, widthRatio: 0.18, heightRatio: 0.055, districtId: 18, opacity: opacity),
              // Santarém (id 20)
              MapHitbox(constraints: constraints, xRatio: 0.31, yRatio: 0.41, widthRatio: 0.16, heightRatio: 0.055, districtId: 20, opacity: opacity),
              MapHitbox(constraints: constraints, xRatio: 0.26, yRatio: 0.44, widthRatio: 0.14, heightRatio: 0.11, districtId: 20, opacity: opacity),
              // Vila Real (id 21)
              MapHitbox(constraints: constraints, xRatio: 0.45, yRatio: 0.065, widthRatio: 0.14, heightRatio: 0.11, districtId: 21, opacity: opacity),
              // Viana do Castelo (id 22)
              MapHitbox(constraints: constraints, xRatio: 0.25, yRatio: 0.024, widthRatio: 0.18, heightRatio: 0.065, districtId: 22, opacity: opacity)
            ],
          );
        },
      ),
    ),
    );
  }
}

