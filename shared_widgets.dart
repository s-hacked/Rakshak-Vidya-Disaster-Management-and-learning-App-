// lib/shared_widgets.dart
import 'package:flutter/material.dart';

// SIDEBAR WIDGETS
class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF0B6B36),
        child: Icon(Icons.shield, color: Colors.white),
      ),
      title: const Text('SafeGuard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: const Text('Disaster Management', style: TextStyle(fontSize: 12)),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const SidebarMenu({required this.selectedIndex, required this.onSelect, super.key});

  Widget item(IconData icon, String label, int index) {
    bool selected = selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: selected
          ? BoxDecoration(
              color: const Color(0xFFE9F3EA),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: ListTile(
        leading: Icon(icon, color: selected ? const Color(0xFF0B6B36) : Colors.grey[700]),
        title: Text(label,
            style: TextStyle(color: selected ? const Color(0xFF0B6B36) : Colors.black87)),
        dense: true,
        visualDensity: VisualDensity.compact,
        onTap: () => onSelect(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item(Icons.home, 'Home', 0),
        item(Icons.school, 'Learn', 1),
        item(Icons.warning, 'Emergency', 2),
        item(Icons.videogame_asset, 'Games', 3),
        item(Icons.notifications, 'Alerts', 4),
        item(Icons.fitness_center, 'Drills', 5),
        item(Icons.chat, 'AI Chat', 6),
        item(Icons.timeline, 'Progress', 7),
      ],
    );
  }
}

// COMMON WIDGETS
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('Master disaster preparedness through interactive modules',
            style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class GoalItem extends StatelessWidget {
  final String label;
  final int current;
  final int total;
  const GoalItem(this.label, this.current, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    double pct = total == 0 ? 0 : current / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: pct,
          minHeight: 8,
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0B6B36)),
        ),
        const SizedBox(height: 6),
        Text('$current/$total', style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}