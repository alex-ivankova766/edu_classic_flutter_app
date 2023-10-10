import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CompletedIndicator extends StatelessWidget {
  final double percent;
  final Color color;

  const CompletedIndicator(
      {Key? key, required this.percent, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Completed ${percent * 100}%',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: percent,
          progressColor: color,
          backgroundColor: Colors.grey,
        ),
      ],
    );
  }
}