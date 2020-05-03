import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';

import '../../global.dart';
import '../../global.dart';
import '../screens/home.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: <Widget>[

        Container(
          height: 100,
        ),
        
        Container(
          alignment: Alignment.center,
          child: Text(
            "Username: " + userName,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),

        Container(
          height: 100,
        ),

        RaisedButton(
          child: Text(
            "Usernmame wechseln"
          ),
          onPressed: (){

          },
        ),

        Container(
          height: 50,
        ),

        RaisedButton(
          child: Text(
            "Passwort ändern"
          ),
          onPressed: (){

          },
        )



      ],
    );
  }
}
