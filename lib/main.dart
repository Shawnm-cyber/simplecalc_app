import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

  class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String output = "";


  

void onButtonPressed(String value) {
    setState(() {
      input += value;
    });
  }

  void clear() {
    setState(() {
      input = "";
      output = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(input, style: TextStyle(fontSize: 30)),
            ),
          ),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: clear, child: Text("C"))),
            ],
          ),
        ],
      ),
    );
  }
}
      