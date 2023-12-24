import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/technology_model.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:provider/provider.dart';

class FilterTechnologiesWidget extends StatefulWidget {
  const FilterTechnologiesWidget({Key? key}) : super(key: key);

  @override
  State<FilterTechnologiesWidget> createState() => _FilterTechnologiesWidgetState();
}

class _FilterTechnologiesWidgetState extends State<FilterTechnologiesWidget> {

  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the isCheckedList with the checked state for each checkbox
    isCheckedList = List.generate(Technology.technologies.length, (index) =>
        Provider.of<Filter>(context, listen: false).technologyFilters.contains(Technology.technologies[index])
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    List<Technology> technologies = Technology.technologies;

    Filter filterParameters = Provider.of<Filter>(context);

    return
      Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05),
        child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.06,
                child: Text(
                  'Tecnologias',
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
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.06), // Add space here
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: technologies.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: screenHeight * 0.01),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: 10,
                          ),
                          decoration:
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromRGBO(255, 255, 255, 0.83),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                technologies[index].string,
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
                                  key: Key("checkBoxTechnology$index"),
                                  value: isCheckedList[index],
                                  onChanged: (bool? newValue) {

                                    setState(() {
                                      isCheckedList[index] = newValue ?? false;
                                    });

                                    // Notify the listeners of the change
                                    Provider.of<Filter>(context, listen: false).updateFilterTechnology(index, newValue ?? false);
                                  },
                                ),
                              )
                            ],
                          ));
                    }),
        ],
              ),
            ],
        ),
      );
  }
}
