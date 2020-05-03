import 'package:flutter/material.dart';
import 'package:shop_delivery/ui/screens/confirmOrder.dart';
import 'package:shop_delivery/ui/screens/details.dart';
import 'package:shop_delivery/ui/screens/home.dart';
import 'package:shop_delivery/ui/screens/login.dart';
import 'package:shop_delivery/ui/screens/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: Login(),
      routes: {
        'homescreen'  : (ctx) => HomeScreen(),
        'orderscreen' : (ctx) => OrdersScreen(),
        'confirmOrder': (ctx) => ConfirmOrder()
      },
    );
  }
}
