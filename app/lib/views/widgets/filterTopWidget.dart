import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/map-screen.dart';

class FilterTopWidget extends StatelessWidget {
  const FilterTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.08),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Text(
              'Filtros',
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: screenWidth * 0.06,
                // Use percentage of screen width for font size
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          // linha por baixo de text: Filtros
          Positioned(
            top: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: const Divider(
              color: Colors.white, // Set the color of the line to white
              thickness: 2.0, // Set the thickness of the line
            ),
          ),
          Positioned(
            top: screenHeight * 0.005,
            left: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
              child: Transform.scale(
                scale: 1.5,
                // Calculate the scale factor based on desired size
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
