import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Input Example',
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  void _handleInput() { //Controls the user output and how its printed out
    setState(() {
      _inputText = _controller.text;
    });
    print("User input: $_inputText");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moodie Journal Entry!")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "What would you like to journal?",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            IconButton(
              onPressed: _handleInput,
              icon: Icon(Icons.add, size: 80,
              color: Colors.greenAccent
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$_inputText",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}