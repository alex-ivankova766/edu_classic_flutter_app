import 'package:flutter/material.dart';

import 'data/course.dart';
import 'course_view.dart';

class Courses extends StatelessWidget {
  const Courses({
    Key? key,
  }) : super(key: key);

  static const _minimumCourseWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;

      // How many courses will fit, horizontally?
      final coursesPerRow = (availableWidth / _minimumCourseWidth).floor();
      final numberOfRows = (Course.shortList.length / coursesPerRow).ceil();

      final customGrid = <Widget>[];

      // Loop over all rows in the custom grid
      for (var row = 0; row < numberOfRows; row++) {
        final coursesInRow = <Widget>[];

        // Loop over all courses in the current row
        for (var currentRowIndex = 0;
            currentRowIndex < coursesPerRow;
            currentRowIndex++) {

          final courseGlobalIndex = row * coursesPerRow + currentRowIndex;

          // If the last row is not full, break the loop
          if (courseGlobalIndex >= Course.shortList.length) {
            // The row is not full, add a spacer
            coursesInRow.add(Spacer());
            break;
          }

          // If there are more courses to add, add them to the current row
          final currentCourse = Course.shortList[courseGlobalIndex];
          coursesInRow.add(
            Expanded(child: CourseView(course: currentCourse)),
          );
        }

        // Add the current row to the custom grid
        customGrid.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: coursesInRow,
        ));
      }
      return ListView(
        children: customGrid,
      );
    });
  }
}
