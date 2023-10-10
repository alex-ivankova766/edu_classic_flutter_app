import 'package:flutter/material.dart';

class Course {
  final String title;
  final String description;
  final int price;
  final double completed;
  final Color color;
  final List<String> lessons;

  const Course({
    required this.title,
    required this.description,
    required this.price,
    required this.completed,
    required this.color,
    this.lessons = const [],
  });

  static List<String> _copyLessons(int quantity, List<String> lessons) {
    var returnLessons = lessons;
    for (var i = 0; i < quantity; i++) {
      returnLessons += lessons;
    }
    return returnLessons;
  }

  static final shortList = [
    Course(
        title: 'Beginner course on Dart',
        description:
            '''Learn Dart for free with this interactive course. Dart is a clean, simple, class-based object-oriented language that has more structure than JavaScript, the programming language it's heavily based on.''',
        price: 25,
        completed: 0.3,
        lessons: ['Install Dart', 'Run Dart', 'Profit'],
        color: Colors.green[200]!),
    Course(
        title: 'Beginning Flutter: Android',
        description:
            '''Flutter is Google’s mobile UI framework used for crafting high-quality native interfaces on iOS and Android. This course focuses on building applications for the Android platform.''',
        price: 27,
        completed: 0.7,
        lessons: [
          'Install Flutter',
          'Open Android Studio',
          'Write Code',
          'Debug on Simulator',
          ..._copyLessons(10, ['Write More Code', 'More Debug on Simulator']),
        ],
        color: Colors.blue[200]!),
    Course(
        title: 'Developing Web Applications with Dart',
        description:
            '''Dart is a fully object-oriented, class-based, simple, and clean language. Google’s popular mobile framework, Flutter uses Dart language to implement high-quality native applications, so it’s recommended that you understand Flutter before beginning this course.''',
        price: 35,
        completed: 0.6,
        color: Colors.red[200]!),
    Course(
        title: 'Master State Management in Flutter',
        description:
            '''Flutter SDK is an excellent tool for developing cross-platform applications from a single codebase. So, it's no surprise that many professionals and learners have decided to gain mastery over Flutter concepts.''',
        price: 45,
        completed: 0.2,
        color: Colors.yellow[200]!),
  ];
}