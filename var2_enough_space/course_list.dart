import 'package:flutter/material.dart';

import 'app_menu.dart';
import 'drawer.dart';
import 'course_view.dart';
import 'data/course.dart';
import 'app_layout.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallerDevice = width < AppLayout.widthFirstBreakpoint;

    final courseList = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (_, index) => CourseView(course: Course.shortList[index]),
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: Course.shortList.length,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: const Text('Not a fully responsive app'),
      ),
      drawer: smallerDevice ? const AppDrawer() : null,
      body: smallerDevice
          ? courseList
          : Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: AppMenu(),
                ),
                Expanded(
                  flex: 6,
                  child: courseList,
                ),
              ],
            ),
    );
  }
}
