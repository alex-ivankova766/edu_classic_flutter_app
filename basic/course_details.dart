import 'package:flutter/material.dart';

import 'data/course.dart';
import 'completed_indicator.dart';

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // The scrollable widget takes all available space, after the
                // bottom area takes whatever it needs.
                Expanded(child: _scrollableView()),
                _bottomArea(),
              ],
            ),
            Positioned(
              child: FloatingActionButton(
                onPressed: () {
                  // Navigate back.
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.close),
                mini: true,
              ),
              top: 16,
              left: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget _scrollableView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              color: course.color,
              child: const Center(
                child: Icon(Icons.image),
              ),
            ),
            const SizedBox(height: 61),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 0.5,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      course.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ...course.lessons.map((lesson) {
                    return Row(
                      children: [
                        const Text("• "),
                        Expanded(
                          child: Text(lesson),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _bottomArea() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        // Box shadow. It must be visible only on the top.
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: -1,
          blurRadius: 7,
          offset: const Offset(0, -6),
        )
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CompletedIndicator(
              percent: course.completed, color: course.color),
        ),
      ),
    );
  }
}