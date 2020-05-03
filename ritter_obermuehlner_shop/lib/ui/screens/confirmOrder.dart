import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';

import '../../global.dart';
import '../../global.dart';
import '../screens/home.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {

  String getDeliveryPrice(){
      double price = 0;

      for(int i = 0; i < basket.length; i++){
        price += double.parse((basket[i].price * basket[i].amount).toStringAsFixed(2));
      }

      return price.toString() + " Fr.";
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "Vielen Dank für Ihre Bestellung!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "Gesamtwert: " + getDeliveryPrice(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          )

        ],
      )
    );
  }
}
