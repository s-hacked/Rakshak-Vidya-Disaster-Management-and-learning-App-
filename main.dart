import 'package:flutter/material.dart';

// Imports
import 'home_page.dart';
import 'education_page.dart';
import 'emergency_page.dart';
import 'games_page.dart';
import 'alerts_page.dart';
import 'drills_page.dart';
import 'ai_chat_page.dart';
import 'progress_page.dart';
import 'shared_widgets.dart';

void main() {
  runApp(SafeGuardApp()); // removed const
}

class SafeGuardApp extends StatelessWidget {
  SafeGuardApp({super.key}); // removed const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGuard Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0B6B36),
        scaffoldBackgroundColor: const Color(0xFFF7F9F7),
        fontFamily: 'Roboto',
      ),
      home: DashboardPage(), // removed const
    );
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key}); // removed const

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final double sidebarWidth = 220;
  int _selectedIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const EducationPage();
      case 2:
        return const EmergencyPage();
      case 3:
        return const GamesPage();
      case 4:
        return const AlertsPage();
      case 5:
        return DrillsPage();
      case 6:
        return const AIChatPage();
      case 7:
        return const ProgressPage();
      default:
        return const Center(child: Text("Page not found")); // this can stay const
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sidebarWidth,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  const SidebarHeader(),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SidebarMenu(
                      selectedIndex: _selectedIndex,
                      onSelect: _onSelect,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'SafeGuard v1.0\nPremium Disaster Management',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  )
                ],
              ),
            ),
            // Expanded main content
            Expanded(
              child: _getPage(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}
