import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalcApp(),
    );
  }
}

class CalcApp extends StatefulWidget {
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClicked(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clearExpression(String text) {
    setState(() {
      _history = '';
      _expression = '0';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283637),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment(1, 1),
            padding: EdgeInsets.only(right: 12),
            child: Text(
              _history,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 24), color: Color(0xFF545F61)),
            ),
          ),
          Container(
            alignment: Alignment(1, 1),
            padding: EdgeInsets.all(12),
            child: Text(
              _expression,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48), color: Colors.white),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: 'AC',
                fillColor: 0xFF6C807F,
                textSize: 20,
                cb: allClear,
              ),
              CalcButton(
                text: 'C',
                fillColor: 0xFF6C807F,
                cb: clearExpression,
              ),
              CalcButton(
                text: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                cb: numClicked,
              ),
              CalcButton(
                text: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                cb: numClicked,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(text: '7', cb: numClicked),
              CalcButton(
                text: '8',
                cb: numClicked,
              ),
              CalcButton(
                text: '9',
                cb: numClicked,
              ),
              CalcButton(
                text: '*',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                cb: numClicked,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '4',
                cb: numClicked,
              ),
              CalcButton(
                text: '5',
                cb: numClicked,
              ),
              CalcButton(
                text: '6',
                cb: numClicked,
              ),
              CalcButton(
                  text: '-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  cb: numClicked)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '1',
                cb: numClicked,
              ),
              CalcButton(
                text: '2',
                cb: numClicked,
              ),
              CalcButton(
                text: '3',
                cb: numClicked,
              ),
              CalcButton(
                text: '+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                cb: numClicked,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '.',
                cb: numClicked,
              ),
              CalcButton(
                text: '0',
                cb: numClicked,
              ),
              CalcButton(
                text: '00',
                textSize: 24,
                cb: numClicked,
              ),
              CalcButton(
                text: '=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                cb: evaluate,
              )
            ],
          ),
        ],
      ),
    );
  }
}
