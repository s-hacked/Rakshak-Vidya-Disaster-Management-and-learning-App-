// lib/drills_page.dart
import 'package:flutter/material.dart';
import 'dart:async';

class DrillsPage extends StatelessWidget {
  DrillsPage({super.key}); // removed const

  Widget drillCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String scenario,
    required int minDuration,
    required int maxDuration,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with icon + title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: iconColor.withOpacity(0.15),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(description,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Scenario
            Text("Scenario:",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[800])),
            const SizedBox(height: 4),
            Text(scenario, style: const TextStyle(color: Colors.black87)),

            const SizedBox(height: 12),

            // Duration
            Row(
              children: [
                const Icon(Icons.access_time, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text("$minDuration–$maxDuration minutes",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),

            const Spacer(),

            // Start Drill Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DrillInstructionsPage(
                        title: title,
                        scenario: scenario,
                        minDuration: minDuration,
                        maxDuration: maxDuration,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B6B36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text(
                  "Start Drill",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      children: [
        drillCard(
          icon: Icons.terrain,
          iconColor: Colors.orange,
          title: "Earthquake Drill",
          description:
              "Practice drop, cover, and hold procedures during ground shaking.",
          scenario: "Sudden earthquake while at home, school, or office.",
          minDuration: 5,
          maxDuration: 10,
          context: context,
        ),
        drillCard(
          icon: Icons.local_fire_department,
          iconColor: Colors.red,
          title: "Fire Evacuation Drill",
          description:
              "Learn how to safely evacuate during smoke or fire emergencies.",
          scenario: "Smoke detected in building with blocked exits.",
          minDuration: 8,
          maxDuration: 12,
          context: context,
        ),
        drillCard(
          icon: Icons.water,
          iconColor: Colors.blue,
          title: "Flood Response Drill",
          description: "Practice quick evacuation and flood safety steps.",
          scenario:
              "Rising water levels and need for relocation to safe ground.",
          minDuration: 10,
          maxDuration: 15,
          context: context,
        ),
        drillCard(
          icon: Icons.air,
          iconColor: Colors.teal,
          title: "Severe Weather Drill",
          description:
              "Learn how to shelter in place or evacuate during storms.",
          scenario: "Tornado or cyclone warning issued for your area.",
          minDuration: 12,
          maxDuration: 18,
          context: context,
        ),
        drillCard(
          icon: Icons.landscape,
          iconColor: Colors.brown,
          title: "Landslide Drill",
          description:
              "Practice safe actions during slope failure in hilly areas.",
          scenario: "Sudden ground movement or landslide warning near you.",
          minDuration: 10,
          maxDuration: 12,
          context: context,
        ),
        drillCard(
          icon: Icons.waves,
          iconColor: Colors.indigo,
          title: "Tsunami Drill",
          description:
              "Practice immediate evacuation to higher ground after strong shaking.",
          scenario:
              "Earthquake near coastal region followed by tsunami warning.",
          minDuration: 15,
          maxDuration: 20,
          context: context,
        ),
      ],
    );
  }
}

// Drill Instructions + Timer Page
class DrillInstructionsPage extends StatefulWidget {
  final String title;
  final String scenario;
  final int minDuration;
  final int maxDuration;

  const DrillInstructionsPage({
    Key? key,
    required this.title,
    required this.scenario,
    required this.minDuration,
    required this.maxDuration,
  }) : super(key: key);

  @override
  State<DrillInstructionsPage> createState() => _DrillInstructionsPageState();
}

class _DrillInstructionsPageState extends State<DrillInstructionsPage> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;

  void startDrill() {
    final durationMinutes = widget.minDuration; // take min for timer
    setState(() {
      _remainingSeconds = durationMinutes * 60;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Drill Completed"),
            content: const Text("Great job! You have completed the drill."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"))
            ],
          ),
        );
      }
    });
  }

  void stopDrill() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final min = seconds ~/ 60;
    final sec = seconds % 60;
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Scenario:",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 6),
            Text(widget.scenario, style: const TextStyle(fontSize: 15)),

            const SizedBox(height: 20),

            if (_isRunning)
              Center(
                child: Text(
                  "Time Remaining: ${formatTime(_remainingSeconds)}",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),

            const Spacer(),

            if (!_isRunning)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: startDrill,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: const Text("Start Drill"),
                ),
              ),

            if (_isRunning)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: stopDrill,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  child: const Text("End Drill"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
