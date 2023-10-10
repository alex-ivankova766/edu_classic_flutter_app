import 'package:flutter/material.dart';

import 'data/course.dart';
import 'course_view.dart';
import 'drawer.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: const Text('Not a responsive app'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (_, index) =>
              CourseView(course: Course.shortList[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 15),
          itemCount: Course.shortList.length,
        ),
      ),
    );
  }
}