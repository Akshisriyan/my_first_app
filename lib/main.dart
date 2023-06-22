import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: const Color.fromARGB(255, 247, 246, 246),
          )),
          //buttons area

          Row(
            children: [
              button(text: "AC"),
              button(text: "<"),
              button(text: "", buttonBgColor: Color.fromARGB(0, 0, 0, 0)),
              button(text: "/")
            ],
          ),

          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "*")
            ],
          ),

          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "/")
            ],
          ),

          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+")
            ],
          ),

          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(text: "=")
            ],
          )
        ],
      ),
    );
  }
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
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 30,
                  color: tcolor,
                  fontWeight: FontWeight.bold,
                ),
              ))));
}
