import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';
import 'package:shop_delivery/ui/screens/details.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if(currentCount != 1){
                currentCount -= 1;
                currentCount = currentCount;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.remove),
          ),
        ),

        SizedBox(width: 15.0),
        Text("$currentCount"),
        SizedBox(width: 15.0),

        GestureDetector(
          onTap: () {
            setState(() {
              currentCount += 1;
              currentCount = currentCount;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.add),
          ),
        ),

      ],
    );
  }
}
