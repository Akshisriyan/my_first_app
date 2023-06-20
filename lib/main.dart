import 'package:flutter/material.dart';

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
            color: Colors.red,
          )),
          //buttons area

          Row(
            children: [
              Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text("1"))),
            ],
          )
        ],
      ),
    );
  }
}
