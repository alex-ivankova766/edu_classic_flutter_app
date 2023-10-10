import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'course_list.dart';

void main() {
  runApp(const CoursesApp());
}

class CoursesApp extends StatelessWidget {
  const CoursesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      tools: const [
        DeviceSection(),
      ],
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        title: 'A smartphone app',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const CourseList(),
      ),
    );
  }
}