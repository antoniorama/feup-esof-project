import 'package:flutter/material.dart';
import 'package:myapp/models/job.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/pages/job-details-screen.dart';

class ScrollJobs extends StatelessWidget {
  List<Job> jobs;
  ScrollJobs({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      left: screenWidth / 2 - screenWidth * 0.4,
      // this last part should be half of the value we multiply in the width so it is centered
      top: screenHeight * 0.3,
      height: screenHeight * 0.60,
      width: screenWidth * 0.8,
      child: ListView.builder(
        key: const Key("jobList"),
        itemCount: jobs?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailsScreen(job: jobs![index]),
                ),
              );
            },
            child: Container(
              key: const Key("job"),
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color.fromRGBO(255, 255, 255, 0.83),
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobs![index].title ?? '',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: const Color(0x93050505),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // add some space between the two Text widgets
                  Text(
                    jobs![index].company?.name ?? '',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: const Color(0x93050505),
                    ),
                  ),
                ],
              ),

            ),
          );
        },
      ),
    );
  }
}
