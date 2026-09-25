// lib/emergency_page.dart
import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  Widget serviceCard(String title, String subtitle, String number,
      {bool is24x7 = false}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF0B6B36),
              child: Icon(Icons.phone, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  if (is24x7) const SizedBox(height: 6),
                  if (is24x7)
                    const Text(
                      '24x7 Available',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Integrate phone dialer if needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B6B36),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: Text('Call $number'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        serviceCard(
          '112 - ERSS',
          'Pan-India single number for police, fire, and health emergencies.',
          '112',
          is24x7: true,
        ),
        serviceCard(
          '1070 - Relief Commissioner',
          'Central Relief Commissioner for natural calamities.',
          '1070',
          is24x7: true,
        ),
        serviceCard(
          '011-24363260 - NDRF',
          'Earthquakes, floods, and other disaster response.',
          '01124363260',
          is24x7: true,
        ),
        serviceCard(
          '1078 - Disaster Helpline',
          'National disaster management assistance.',
          '1078',
          is24x7: true,
        ),
        serviceCard(
          '100 - Police',
          'Law enforcement emergency helpline.',
          '100',
          is24x7: true,
        ),
        serviceCard(
          '108 - Ambulance',
          'National Ambulance Service (medical, police, fire in some states).',
          '108',
          is24x7: true,
        ),
        serviceCard(
          '1073 - Road Accident',
          'Road accident reporting helpline.',
          '1073',
          is24x7: true,
        ),
        serviceCard(
          '1077 - District Collector/EOC',
          'District Emergency Operations Centre for local disaster management.',
          '1077',
          is24x7: true,
        ),
        serviceCard(
          '1906 - LPG Leak',
          'Report gas leaks and related hazards.',
          '1906',
          is24x7: true,
        ),
        serviceCard(
          '1066 - Anti-Poison',
          'Anti-poison helpline (primary center in New Delhi).',
          '1066',
          is24x7: true,
        ),
        serviceCard(
          '101 - Fire & Rescue',
          'Fire emergencies and rescue operations.',
          '101',
          is24x7: true,
        ),
      ],
    );
  }
}
