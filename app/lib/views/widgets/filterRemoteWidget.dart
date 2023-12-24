import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:provider/provider.dart';

class FilterRemoteWidget extends StatefulWidget {
  const FilterRemoteWidget({Key? key}) : super(key: key);

  @override
  State<FilterRemoteWidget> createState() => _FilterRemoteWidgetState();
}

class _FilterRemoteWidgetState extends State<FilterRemoteWidget> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // Initialize the isChecked variable with the checked state for the checkbox
    print('a');
    isChecked = Provider.of<Filter>(context, listen: false).remote;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Load the filter parameters
    Filter filterParameters = Provider.of<Filter>(context);

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.05),
      child: Stack(
        children: [
          Positioned(
            left: screenWidth * 0.06,
            child: Text(
              'Remoto',
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: screenHeight * 0.06),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(255, 255, 255, 0.83),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trabalho remoto',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: const Color(0x93050505),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        key : const Key("checkBoxRemote"),
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false; // Update the first checkbox value
                          });

                          // Notify the listeners of the change
                          Provider.of<Filter>(context, listen: false)
                              .updateFilterRemote(isChecked); // Update the categoryId as needed
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

