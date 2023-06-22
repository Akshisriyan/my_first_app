import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_first_app/colors.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorAPP(),
  ));
}

class CalculatorAPP extends StatefulWidget {
  const CalculatorAPP({super.key});

  @override
  State<CalculatorAPP> createState() => CalculatorAPPState();
}

class CalculatorAPPState extends State<CalculatorAPP> {
  double firstnumber = 0.0;
  double seconnumber = 0.0;
  var inout = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "AC") {
      inout = '';
      output = '';
      firstnumber = 0.0;
      seconnumber = 0.0;
      operation = '';
    } else if (value == "<") {
      if (inout.isNotEmpty) {
        inout = inout.substring(0, inout.length - 1);
      }
    } else if (value == "=") {
      if (inout.isNotEmpty) {
        var userinput = inout;
        userinput = inout;
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();

        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }

        inout = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      inout = inout + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {
      inout = inout;
      output = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(12),
                  color: const Color.fromARGB(255, 247, 246, 246),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          hideInput ? '' : inout,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          output,
                          style: TextStyle(
                            fontSize: outputSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ))),
          //buttons area

          Row(
            children: [
              button(
                  text: "AC",
                  buttonBgColor: operatorColor,
                  tcolor: orangeColor),
              button(
                  text: "<", buttonBgColor: operatorColor, tcolor: orangeColor),
              button(text: "", buttonBgColor: Color.fromARGB(0, 0, 0, 0)),
              button(
                  text: "/", buttonBgColor: operatorColor, tcolor: orangeColor)
            ],
          ),

          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                  text: "*", buttonBgColor: operatorColor, tcolor: orangeColor)
            ],
          ),

          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(
                  text: "/", buttonBgColor: operatorColor, tcolor: orangeColor)
            ],
          ),

          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(
                  text: "+", buttonBgColor: operatorColor, tcolor: orangeColor)
            ],
          ),

          Row(
            children: [
              button(
                  text: "%", buttonBgColor: operatorColor, tcolor: orangeColor),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: orangeColor)
            ],
          )
        ],
      ),
    );
  }

  Widget button({text, tcolor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(22),
                  primary: buttonBgColor,
                ),
                onPressed: () => onButtonClick(text),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 30,
                    color: tcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ))));
  }
}
