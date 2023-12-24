import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/filter_model.dart';
import 'package:myapp/models/salary_model.dart';

class FilterPriceWidget extends StatefulWidget {
  FilterPriceWidget({Key? key}) : super(key: key);

  @override
  State<FilterPriceWidget> createState() => _FilterPriceWidgetState();
}


class _FilterPriceWidgetState extends State<FilterPriceWidget> {

  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the isCheckedList with the checked state for each checkbox
    isCheckedList = List.generate(Salary.salaries.length, (index) =>
        Provider
            .of<Filter>(context, listen: false)
            .salaryFilters
            .contains(Salary.salaries[index])
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

    List<Salary> salaries = Salary.salaries;

    Filter filterParameters = Provider.of<Filter>(context);

    return
      Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.02),
        child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.06,
                child: Text(
                  'Salário',
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
                Padding(
                  padding: EdgeInsets.only(top: 0.05 * screenHeight),
                  child: Column(
                    children: [
                      for (int index = 0; index < salaries.length; index++)
                        Container(
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
                                  salaries[index].name,
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
                                    key: Key("checkBoxSalary$index"),
                                    value: isCheckedList[index],
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isCheckedList[index] = newValue ?? false;
                                      });
                                      
                                      // Notify the listeners of the change
                                      Provider.of<Filter>(context, listen: false)
                                          .updateFilterSalary(index,
                                          newValue ?? false);
                                    },
                                  ),
                                )
                              ],
                            )),
                    ],
                  ),
                ),
            ]
        ),
      );
  }
}
