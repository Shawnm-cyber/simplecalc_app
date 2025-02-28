import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
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

void calculateResult() {
  try {
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      output = result.toString();
    });
  } catch (e) {
    setState(() {
      output = "Error";
    });
  }
}

Widget buildButton(String value) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        if (value == "=") {
          calculateResult();
        } else if (value == "C") {
          clear();
        } else {
          onButtonPressed(value);
        }
      },
      child: Text(value, style: TextStyle(fontSize: 24)),
    ),
  );
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(input, style: TextStyle(fontSize: 30, color: Colors.black54)),
        Text(output, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      ],
    ),
  ),
),

        Column(
          children: [
            Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("/")]),
            Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("*")]),
            Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("-")]),
            Row(children: [buildButton("0"), buildButton("C"), buildButton("="), buildButton("+")]),
            ],
          ),
        ],
      ),
    );
  }     
}