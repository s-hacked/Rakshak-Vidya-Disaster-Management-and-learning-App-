import 'package:flutter/material.dart';

// ===================================================================
// 1. DATA MODELS
// ===================================================================
enum DisasterCategory { natural, manMade }

/// Represents a single lesson/section within a larger learning module.
class Lesson {
  final String id;
  final String title;
  final String content;
  final List<String> keyFacts;
  final String duration;
  bool isCompleted;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.keyFacts,
    required this.duration,
    this.isCompleted = false,
  });
}

/// Represents an achievement the user can earn.
class Achievement {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  bool isEarned;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.isEarned = false,
  });
}

/// Represents a complete learning module (e.g., Earthquake Preparedness).
class LearningModule {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String duration;
  final String tag;
  final List<Lesson> lessons;
  final DisasterCategory category;

  LearningModule({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.duration,
    required this.tag,
    required this.lessons,
    required this.category,
  });

  /// Calculates progress as a value between 0.0 and 1.0.
  double get progress {
    if (lessons.isEmpty) return 0.0;
    int completedCount = lessons.where((lesson) => lesson.isCompleted).length;
    return completedCount / lessons.length;
  }
}

// ===================================================================
// 2. MOCK DATA SOURCE
// ===================================================================
final List<Achievement> _achievements = [
  Achievement(title: "First Steps", description: "Complete your first module", icon: Icons.star, color: Colors.amber, isEarned: true),
  Achievement(title: "Fire Expert", description: "Master the fire safety module", icon: Icons.local_fire_department, color: Colors.red),
  Achievement(title: "Knowledge Seeker", description: "Complete all available modules", icon: Icons.school, color: Colors.blue),
];

final List<LearningModule> _learningModules = [
  // --- NATURAL DISASTERS ---
  LearningModule(
    id: 'lm1',
    title: 'Earthquake',
    subtitle: 'Prepare and respond effectively',
    icon: Icons.vibration,
    iconColor: Colors.brown.shade700,
    duration: '15 min',
    tag: 'Beginner',
    category: DisasterCategory.natural,
    lessons: [
      Lesson(id: 'l1a', title: 'General Information', duration: "3 min", content: 'An earthquake is the shaking of the Earth\'s surface from a sudden release of energy in the crust that creates seismic waves.', keyFacts: ["Most earthquakes last less than 60 seconds.", "The Richter scale measures magnitude.", "'Drop, Cover, and Hold On' is the recommended response."]),
      Lesson(id: 'l1b', title: 'Precautions', duration: "5 min", content: 'Before:\nSecure heavy items, create an emergency kit, and make an evacuation plan.\n\nDuring:\nDrop, Cover, and Hold On! Stay away from windows and heavy objects.\n\nAfter:\nCheck for injuries and damage. Be prepared for aftershocks.', keyFacts: ["Secure heavy furniture.", "Practice your evacuation plan.", "Stay informed via a battery-powered radio."]),
      Lesson(id: 'l1c', title: 'Reasons / Causes', duration: "2 min", content: 'The primary cause is the movement and friction of tectonic plates. When stress overcomes friction, energy is released in waves.', keyFacts: ["Most earthquakes occur along plate boundaries.", "Volcanic activity can also cause minor earthquakes."]),
      Lesson(id: 'l1d', title: 'First Aid', duration: "3 min", content: 'For cuts, apply direct pressure with a clean cloth. For fractures, immobilize the injured area using a splint. Do not move a person with a serious neck or back injury unless they are in immediate danger.', keyFacts: ["Stop bleeding first.", "Do not try to realign broken bones.", "Keep the victim warm and comfortable."]),
      Lesson(id: 'l1e', title: 'Media (Animations/Infographics)', duration: "1 min", content: 'Visual learning resources like animations and infographics will be available here soon.', keyFacts: ["Animations can demonstrate safety procedures effectively.", "Visuals are excellent for quick reference."]),
      Lesson(id: 'l1f', title: 'Daily Safety Tips', duration: "1 min", content: 'Regularly check your emergency kit to ensure supplies are not expired. Identify the safest place in each room of your house.', keyFacts: ["Awareness is a daily habit."]),
    ],
  ),
  LearningModule(id: 'lm_flood', title: 'Flood', subtitle: 'Overflow of water', icon: Icons.water_drop, iconColor: Colors.blue.shade600, duration: '18 min', tag: 'Intermediate', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_tsunami', title: 'Tsunami', subtitle: 'Large ocean waves', icon: Icons.tsunami, iconColor: Colors.cyan.shade700, duration: '20 min', tag: 'Advanced', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_fire', title: 'Fire', subtitle: 'Prevention & evacuation', icon: Icons.local_fire_department, iconColor: Colors.red.shade600, duration: '12 min', tag: 'Beginner', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_cyclone', title: 'Cyclone', subtitle: 'Rotating storm systems', icon: Icons.cyclone, iconColor: Colors.grey.shade700, duration: '15 min', tag: 'Advanced', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_landslide', title: 'Landslide', subtitle: 'Movement of rock/debris', icon: Icons.landscape, iconColor: Colors.brown.shade400, duration: '10 min', tag: 'Intermediate', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_storm', title: 'Storm', subtitle: 'Severe weather events', icon: Icons.thunderstorm, iconColor: Colors.indigo.shade700, duration: '12 min', tag: 'Intermediate', category: DisasterCategory.natural, lessons: []),
  LearningModule(id: 'lm_wildfire', title: 'Wildfires', subtitle: 'Uncontrolled forest fires', icon: Icons.forest, iconColor: Colors.deepOrange.shade600, duration: '15 min', tag: 'Advanced', category: DisasterCategory.natural, lessons: []),
  
  // --- MAN-MADE DISASTERS ---
  LearningModule(id: 'lm_chem', title: 'Chemical Spills', subtitle: 'Hazardous material release', icon: Icons.science, iconColor: Colors.green.shade700, duration: '20 min', tag: 'Advanced', category: DisasterCategory.manMade, lessons: []),
  LearningModule(id: 'lm_nuclear', title: 'Nuclear Accidents', subtitle: 'Radiation emergencies', icon: Icons.settings_input_component, iconColor: Colors.yellow.shade800, duration: '25 min', tag: 'Expert', category: DisasterCategory.manMade, lessons: []),
  LearningModule(id: 'lm_pandemic', title: 'Pandemics', subtitle: 'Widespread epidemics', icon: Icons.coronavirus, iconColor: Colors.purple.shade700, duration: '18 min', tag: 'Intermediate', category: DisasterCategory.manMade, lessons: []),
];

// ===================================================================
// 3. MAIN EDUCATION PAGE WIDGET
// ===================================================================
class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  LearningModule? _selectedModule;
  int _currentLessonIndex = 0;
  int _selectedTabIndex = 0;

  void _openModule(LearningModule module) {
    if (module.lessons.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Content for this module is coming soon!")));
      return;
    }
    setState(() {
      _selectedModule = module;
      _currentLessonIndex = 0;
    });
  }

  void _exitLessonView() {
    setState(() {
      _selectedModule = null;
    });
  }

  void _nextLesson() {
    if (_selectedModule == null) return;
    setState(() {
      _selectedModule!.lessons[_currentLessonIndex].isCompleted = true;
      if (_currentLessonIndex < _selectedModule!.lessons.length - 1) {
        _currentLessonIndex++;
      } else {
        _exitLessonView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _selectedModule == null
        ? _buildEducationHub()
        : _buildLessonView(_selectedModule!);
  }

  Widget _buildEducationHub() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📚 Education Hub', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Master disaster preparedness through interactive learning modules', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          const SizedBox(height: 24),
          _buildTabBar(),
          const SizedBox(height: 24),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _selectedTabIndex == 0
                ? _buildModulesView()
                : _buildAchievementsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildModulesView() {
    final naturalDisasters = _learningModules.where((m) => m.category == DisasterCategory.natural).toList();
    final manMadeDisasters = _learningModules.where((m) => m.category == DisasterCategory.manMade).toList();

    return Column(
      key: const ValueKey('modules'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategorySection("Natural Disasters", naturalDisasters),
        const SizedBox(height: 24),
        _buildCategorySection("Man-Made Disasters", manMadeDisasters),
      ],
    );
  }

  Widget _buildCategorySection(String title, List<LearningModule> modules) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 700 ? 1 : (screenWidth < 1100 ? 2 : 3);
    final childAspectRatio = screenWidth < 700 ? 2.8 : 1.6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            return ModuleCard(
              module: modules[index],
              onTap: () => _openModule(modules[index]),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLessonView(LearningModule module) {
    final lesson = module.lessons[_currentLessonIndex];
    final totalLessons = module.lessons.length;
    final progressValue = (_currentLessonIndex + 1) / totalLessons;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(icon: const Icon(Icons.arrow_back), label: const Text('Back to Hub'), onPressed: _exitLessonView),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Section ${_currentLessonIndex + 1} of $totalLessons', style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progressValue, minHeight: 8, borderRadius: BorderRadius.circular(4)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.play_circle_outline, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(child: Text(lesson.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    Chip(label: Text('🕒 ${lesson.duration}')),
                  ]),
                  const Divider(height: 24),
                  Text(lesson.content.replaceAll(r'\n', '\n'), style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5)),
                  if (lesson.keyFacts.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text("Key Facts:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    for (String fact in lesson.keyFacts)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text("• ", style: TextStyle(color: Colors.grey)),
                          Expanded(child: Text(fact, style: TextStyle(color: Colors.grey[700]))),
                        ]),
                      ),
                  ],
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Section ${_currentLessonIndex + 1} of $totalLessons', style: TextStyle(color: Colors.grey[700])),
                      ElevatedButton(
                        onPressed: _nextLesson,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(_currentLessonIndex < totalLessons - 1 ? 'Next Section' : 'Finish Module'),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward, size: 16)
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [_buildTabButton("Learning Modules", 0), _buildTabButton("Achievements", 1)],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    bool isActive = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isActive ? [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))] : [],
          ),
          child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal, color: isActive ? Colors.green[800] : Colors.grey[600])),
        ),
      ),
    );
  }

  Widget _buildAchievementsList() {
    return ListView.separated(
      key: const ValueKey('achievements'),
      itemCount: _achievements.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final achievement = _achievements[index];
        return Card(
          color: achievement.isEarned ? Colors.green.shade50 : null,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: achievement.color, child: Icon(achievement.icon, color: Colors.white)),
            title: Text(achievement.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(achievement.description),
            trailing: achievement.isEarned ? const Chip(label: Text('Earned'), backgroundColor: Colors.green) : null,
          ),
        );
      },
    );
  }
}

// ===================================================================
// 4. MODULE CARD WIDGET
// ===================================================================

class ModuleCard extends StatelessWidget {
  final LearningModule module;
  final VoidCallback onTap;

  const ModuleCard({Key? key, required this.module, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = module.progress >= 1.0;
    final bool isStarted = module.progress > 0.0;
    final buttonText = isCompleted ? 'Review' : (isStarted ? 'Continue' : 'Start');

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: module.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(module.icon, color: module.iconColor, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(module.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(module.subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600]), maxLines: 2, overflow: TextOverflow.ellipsis),
                ]),
              ),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(16)),
                  child: Text('✓ Complete', style: TextStyle(color: Colors.green.shade800, fontSize: 10, fontWeight: FontWeight.w500)),
                ),
            ]),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Progress', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('${(module.progress * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: module.progress,
              minHeight: 6,
              borderRadius: BorderRadius.circular(6),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0B6B36)),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text('⏱️ ${module.duration} • 📖 ${module.lessons.length} sections', style: TextStyle(fontSize: 12, color: Colors.grey[700]))
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B6B36),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Row(children: [
                  Text(buttonText),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, size: 16),
                ]),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}