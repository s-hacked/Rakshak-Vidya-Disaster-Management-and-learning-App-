// lib/games_page.dart
import 'package:flutter/material.dart';
import 'dart:async';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GamesHomeScreen();
  }
}

class GamesHomeScreen extends StatelessWidget {
  const GamesHomeScreen({super.key});

  Widget gameCard(BuildContext context, String title, String description,
      String status, String buttonText, Color statusColor, Widget screen) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(description,
                style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => screen),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B6B36),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Games & Challenges", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        gameCard(
          context,
          "Quiz Challenge",
          "MCQ quizzes and scenario-based questions with progress badges",
          "Available",
          "Start Quiz",
          Colors.green,
          const QuizChallengeScreen(),
        ),
        const SizedBox(height: 12),
        gameCard(
          context,
          "Disaster Escape",
          "Virtual simulation where you make safety decisions in emergencies",
          "3 Scenarios",
          "Play Now",
          Colors.green,
          const DisasterEscapeScreen(),
        ),
        const SizedBox(height: 12),
        gameCard(
          context,
          "Time Challenge",
          "Quick-fire emergency decisions under time pressure",
          "High Intensity",
          "Challenge",
          Colors.red,
          const TimeChallengeScreen(),
        ),
        const SizedBox(height: 12),
        gameCard(
          context,
          "First Aid Challenge",
          "Test your knowledge on handling common injuries.",
          "Available",
          "Start",
          Colors.blue,
          FirstAidChallenge(),
        ),
      ],
    );
  }
}

// 1. QUIZ CHALLENGE
class QuizChallengeScreen extends StatefulWidget {
  const QuizChallengeScreen({super.key});

  @override
  State<QuizChallengeScreen> createState() => _QuizChallengeScreenState();
}

class _QuizChallengeScreenState extends State<QuizChallengeScreen> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, Object>> questions = [
    {
      "question": "What should you do during an earthquake?",
      "options": ["Run outside", "Drop, Cover, Hold", "Use elevator"],
      "answer": "Drop, Cover, Hold"
    },
    {
      "question": "Which item is essential in a survival kit?",
      "options": ["Chocolate", "Torch", "Video Game"],
      "answer": "Torch"
    },
  ];

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestion]["answer"]) {
      setState(() {
        score++;
      });
    }
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Quiz Completed"),
          content: Text("Your Score: $score / ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back from the quiz screen
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Challenge")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question["question"] as String,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(question["options"] as List<String>).map(
              (option) => ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(option),
              ),
            ).toList(),
            const Spacer(),
            Text("Score: $score", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// 2. DISASTER ESCAPE
class DisasterEscapeScreen extends StatefulWidget {
  const DisasterEscapeScreen({super.key});

  @override
  State<DisasterEscapeScreen> createState() => _DisasterEscapeScreenState();
}

class _DisasterEscapeScreenState extends State<DisasterEscapeScreen> {
  int currentStep = 0;
  final List<Map<String, dynamic>> scenarios = [
    {
      "situation": "You are in a classroom during an earthquake.",
      "choices": [
        {"text": "Run outside immediately", "isCorrect": false},
        {"text": "Drop, Cover, Hold", "isCorrect": true},
        {"text": "Stand near windows", "isCorrect": false},
      ]
    },
    {
      "situation": "Fire alarm rings in hostel. What will you do?",
      "choices": [
        {"text": "Use elevator", "isCorrect": false},
        {"text": "Exit using stairs", "isCorrect": true},
        {"text": "Hide under bed", "isCorrect": false},
      ]
    },
  ];

  void selectChoice(bool isCorrect) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isCorrect ? "Correct Decision ✅" : "Wrong Decision ❌")),
    );

    if (currentStep < scenarios.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Simulation Complete"),
          content: const Text("Well done! You finished the escape scenarios."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back
              },
              child: const Text("Finish"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var scenario = scenarios[currentStep];
    return Scaffold(
      appBar: AppBar(title: const Text("Disaster Escape")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              scenario["situation"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(scenario["choices"] as List<Map<String, dynamic>>).map(
              (choice) => ElevatedButton(
                onPressed: () => selectChoice(choice["isCorrect"]),
                child: Text(choice["text"]),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}

// 3. TIME CHALLENGE
class TimeChallengeScreen extends StatefulWidget {
  const TimeChallengeScreen({super.key});

  @override
  State<TimeChallengeScreen> createState() => _TimeChallengeScreenState();
}

class _TimeChallengeScreenState extends State<TimeChallengeScreen> {
  int timeLeft = 10;
  int score = 0;
  int currentQ = 0;
  Timer? timer;

  final List<Map<String, Object>> questions = [
    {"q": "Where is the safest place during an earthquake?", "a": "Under sturdy desk"},
    {"q": "Which number do you call for fire emergency in India?", "a": "101"},
    {"q": "What should you carry during floods?", "a": "Drinking water"},
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        if (timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
        } else {
          nextQuestion();
        }
      } else {
        t.cancel();
      }
    });
  }

  void nextQuestion() {
    if (currentQ < questions.length - 1) {
      setState(() {
        currentQ++;
        timeLeft = 10;
      });
    } else {
      timer?.cancel();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Challenge Over"),
          content: Text("Your Score: $score / ${questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  void checkAnswer(String input) {
    if (input.trim().toLowerCase() ==
        (questions[currentQ]["a"] as String).toLowerCase()) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentQ];
    return Scaffold(
      appBar: AppBar(title: const Text("Time Challenge")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Time Left: $timeLeft s",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text(q["q"] as String, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: "Your Answer",
                border: OutlineInputBorder(),
              ),
              onSubmitted: checkAnswer,
            ),
            const Spacer(),
            Text("Score: $score"),
          ],
        ),
      ),
    );
  }
}


// 4. FIRST AID CHALLENGE
class FirstAidChallenge extends StatefulWidget {
  @override
  _FirstAidChallengeState createState() => _FirstAidChallengeState();
}

class _FirstAidChallengeState extends State<FirstAidChallenge> {
  List<Map<String, Object>> scenarios = [
    {
      'injury': 'Cut on the arm',
      'options': ['Apply antiseptic and bandage', 'Ignore it', 'Wash with soda', 'Tie a rope'],
      'answer': 'Apply antiseptic and bandage'
    },
    {
      'injury': 'Burn on hand',
      'options': ['Use cold water', 'Apply butter', 'Wrap with plastic', 'Use sand'],
      'answer': 'Use cold water'
    },
    {
      'injury': 'Sprained ankle',
      'options': ['Rest and elevate', 'Run immediately', 'Ignore it', 'Apply perfume'],
      'answer': 'Rest and elevate'
    },
  ];

  int current = 0;
  int score = 0;

  void answer(String selected) {
    if (selected == scenarios[current]['answer']) {
      score += 10;
    }
    if (current < scenarios.length - 1) {
      setState(() {
        current++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Challenge Completed'),
          content: Text('Your score is $score'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sc = scenarios[current];
    return Scaffold(
      appBar: AppBar(title: Text('First Aid Challenge')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Scenario ${current + 1}/${scenarios.length}', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text('Injury: ${sc['injury']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...(sc['options'] as List<String>).map((opt) {
              return ElevatedButton(
                onPressed: () => answer(opt),
                child: Text(opt),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}