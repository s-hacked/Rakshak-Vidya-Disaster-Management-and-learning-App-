import 'package:flutter/material.dart';
import 'dart:async';

class AIChatPage extends StatefulWidget {
  const AIChatPage({super.key});

  @override
  State<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends State<AIChatPage> {
  final List<Map<String, dynamic>> _messages = [
    {
      "sender": "bot",
      "text": "Hi There! I'm your AI assistant for disaster preparedness.\n\n"
          "How can I help you today?",
      "options": [
        "What to do in a flood?",
        "Create an emergency kit",
        "Latest alerts"
      ]
    }
  ];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": text});
      _controller.clear();
    });
    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _messages.add({
          "sender": "bot",
          "text":
              "Great question about '$text'. Here is some general advice. For more specific details, please check the 'Learn' section.",
          "options": [
            "What to do in an earthquake?",
            "Tell me about fire safety",
            "How to prepare for a heatwave?"
          ]
        });
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildMessage(Map<String, dynamic> msg) {
    final isUser = msg["sender"] == "user";
    final hasOptions = msg["options"] != null;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: const EdgeInsets.all(12),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF0B6B36) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              msg["text"] ?? "",
              style: TextStyle(
                  color: isUser ? Colors.white : Colors.black, fontSize: 15),
            ),
            if (hasOptions) ...[
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (msg["options"] as List<String>)
                    .map((opt) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF0B6B36),
                              side: const BorderSide(color: Color(0xFF0B6B36)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () => _sendMessage(opt),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(opt),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F7),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                    ),
                    onSubmitted: (value) => _sendMessage(value),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B6B36),
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  child: const Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}