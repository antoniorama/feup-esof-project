import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String topText;
  final String hintText;
  final bool obsText;

  const InputTextBox({Key? key, required this.controller, required this.topText, required this.hintText, required this.obsText}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              topText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              key: Key('fill$hintText'),
              obscureText: obsText,

              controller: controller,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: Color(0xffffffff),
              ),
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
