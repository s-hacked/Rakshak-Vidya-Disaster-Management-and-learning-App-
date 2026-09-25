// lib/alerts_page.dart
import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class AlertsPage extends StatelessWidget {
   const AlertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionTitle('Recent Alerts'),
      const SizedBox(height: 12),
      const Card(child: ListTile(leading: Icon(Icons.warning, color: Colors.red), title: Text("Flood Warning - Coastal Area"), subtitle: Text("Issued 2 hours ago"))),
      const SizedBox(height: 8),
      const Card(child: ListTile(leading: Icon(Icons.warning, color: Colors.orange), title: Text("Heatwave Alert - City Center"), subtitle: Text("Issued 1 day ago"))),
      const SizedBox(height: 8),
      const Card(child: ListTile(leading: Icon(Icons.notification_important, color: Colors.blue), title: Text("Drill Notification - Fire Safety"), subtitle: Text("Scheduled for tomorrow"))),
    ]);
  }
}