import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/course.dart';
import 'completed_indicator.dart';
import 'course_details.dart';

class CourseView extends StatelessWidget {
  final Course course;

  const CourseView({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          CupertinoModalPopupRoute(
            builder: (context) => CourseDetails(course: course),
          ),
        );
      },
      child: Card(
        elevation: 1,
        shadowColor: Colors.black45.withAlpha(125),
        semanticContainer: true,
        shape: const BeveledRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    color: course.color,
                    child: const Center(
                      child: Icon(Icons.image),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.description,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CompletedIndicator(
                percent: course.completed,
                color: course.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}