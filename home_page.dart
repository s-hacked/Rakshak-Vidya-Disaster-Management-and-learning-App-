// lib/home_page.dart
import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopWelcomeCard(),
        SizedBox(height: 18),
        _StatsRow(),
        SizedBox(height: 18),
        _TwoColumnRow(),
        SizedBox(height: 18),
        _SafetyTipCard(),
      ],
    );
  }
}

class _TopWelcomeCard extends StatelessWidget {
  const _TopWelcomeCard();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Welcome Back!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('Stay prepared, stay safe', style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(color: const Color(0xFFFDECEF), borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Emergency SOS\nInstantly alert emergency contacts and share your location',
                        style: TextStyle(color: Colors.red[700]),
                      )),
                      const CircleAvatar(radius: 22, backgroundColor: Colors.red, child: Icon(Icons.flash_on, color: Colors.white))
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(width: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFFEFF7EF), borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  const Text('Score: 78%'),
                  const SizedBox(width: 8),
                  Container(width: 2, height: 18, color: Colors.green[300]),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('2 Active Alerts'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();
  Widget stat(String value, String label, {IconData? icon}) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            children: [
              if (icon != null) Icon(icon, color: Colors.green[700]),
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(label, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        stat('78%', 'Preparedness', icon: Icons.trending_up),
        const SizedBox(width: 12),
        stat('12', 'Drills Done', icon: Icons.group),
        const SizedBox(width: 12),
        stat('8/10', 'Quiz Score', icon: Icons.psychology),
        const SizedBox(width: 12),
        stat('5', 'Badges', icon: Icons.emoji_events),
      ],
    );
  }
}

class _TwoColumnRow extends StatelessWidget {
  const _TwoColumnRow();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Recent Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 12),
                ListTile(
                  dense: true,
                  leading: CircleAvatar(child: Icon(Icons.book)),
                  title: Text('Completed Fire Safety Module'),
                  subtitle: Text('2 hours ago'),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: CircleAvatar(child: Icon(Icons.quiz)),
                  title: Text('Earthquake Quiz - 90% Score'),
                  subtitle: Text('1 day ago'),
                ),
                Divider(),
                ListTile(
                  dense: true,
                  leading: CircleAvatar(child: Icon(Icons.sim_card)),
                  title: Text('Virtual Drill Completed'),
                  subtitle: Text('3 days ago'),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text("This Week's Goals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 12),
                GoalItem('Complete 3 Education Modules', 2, 3),
                SizedBox(height: 10),
                GoalItem('Take 2 Practice Quizzes', 1, 2),
                SizedBox(height: 10),
                GoalItem('Complete Virtual Drill', 0, 1),
              ]),
            ),
          ),
        )
      ],
    );
  }
}

class _SafetyTipCard extends StatelessWidget {
  const _SafetyTipCard();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF0FBF4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Color(0xFF0B6B36)),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                  'Keep a battery-powered or hand-crank radio in your emergency kit to stay informed during power outages. Test it monthly to ensure it works when you need it most.'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B6B36),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: const Text('Learn More'),
            )
          ],
        ),
      ),
    );
  }
}