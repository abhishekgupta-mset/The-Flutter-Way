import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key});

  @override
  State<TipCalculatorScreen> createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  var tip = 15.00;
  var total = 0.00;
  var color = Colors.orange;
  var billAmount = "0.0";
  var reaction = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color),
        body: _buildTipCalculateScreen(context));
  }

  Widget _buildTipCalculateScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Enter bill amount:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12 ,horizontal: 20.0),
            child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  billAmount =value;
                  calculateTip(tip);
                })),
          ),
          const Text("Select tip percentage"),
          Slider(
              value: tip,
              label: "${tip.round()}%",
              divisions: 10,
              min: 0.0,
              max: 30.0,
              activeColor: color,
              inactiveColor: Colors.grey,
              secondaryActiveColor: Colors.black,
              onChanged: (value) => setState(() {
                tip = value;
                color = setColor(tip);
                reaction = setEmoji(tip);
                calculateTip(tip);
              })),
          Text("Tip PKR: ${tipAmount(tip)}"),
         const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          Text("Total PKR: ${total.toStringAsFixed(2)}"),
          const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          Text(reaction, style: const TextStyle(fontSize: 50.0))
        ],
      ),
    );
  }

  void calculateTip(double tipAmount) {
    var bill = double.parse(billAmount);
    if (bill > 0) {
      tip = tipAmount;
      total = bill + (bill*tip)/100;
    }
  }

  String tipAmount(double tip) {
    var bill = double.parse(billAmount);
    if (bill > 0) {
     return "${(bill*tip)/100}";
    }
    return "0.0";
  }

  MaterialColor setColor(double sliderValue) {
    switch (sliderValue) {
      case < 10.0:
        {
          return Colors.red;
        }
      case > 10.0 && < 20:
        {
          return Colors.orange;
        }
      case > 20:
        {
          return Colors.green;
        }
      default:
        {
          return Colors.orange;
        }
    }
  }

  String setEmoji(double sliderValue) {
    switch (sliderValue) {
      case < 5.0:
        {
          return "😈😈😈";
        }
      case < 8.0:
        {
          return "😈😈";
        }
      case < 10.0:
        {
          return "😈";
        }
      case > 10.0 && < 15:
        {
          return "☺️";
        }
      case > 10.0 && < 18:
        {
          return "☺️ 😊";
        }
      case > 10.0 && < 20:
        {
          return "☺️ 😊 😇";
        }
      case > 20.0 && < 23:
        {
          return "😍";
        }
      case > 20.0 && < 25:
        {
          return "😍 😻 ";
        }
      case 30:
        {
          return "☺️ 😊 🥰 🥰";
        }
      default:
        {
          return "";
        }
    }
  }
}
