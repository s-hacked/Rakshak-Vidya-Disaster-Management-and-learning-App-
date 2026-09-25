// lib/progress_page.dart
import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      SectionTitle("Overall Progress"),
      SizedBox(height: 12),
      GoalItem("Education Modules", 4, 6),
      SizedBox(height: 10),
      GoalItem("Practice Quizzes", 3, 5),
      SizedBox(height: 10),
      GoalItem("Virtual Drills", 1, 3),
      SizedBox(height: 30),
      Text("Achievements", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      SizedBox(height: 12),
      Wrap(spacing: 12, children: [Chip(label: Text("Fire Safety Badge")), Chip(label: Text("Flood Awareness Badge")), Chip(label: Text("Preparedness Champion"))]),
    ]);
  }
}