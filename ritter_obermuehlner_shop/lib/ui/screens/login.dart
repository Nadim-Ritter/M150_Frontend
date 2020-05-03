import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';
import '../../global.dart';
import '../screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum FormType {
  login,
  register
}

class _LoginState extends State<Login> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login; 

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _formChange () async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildTextFields(),
              _buildButtons(),
            ],
          ),
        ],
      )
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      title: Text("Spirituosen Shop Oberritter"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/img/oberritterLogo.jpeg"
        ),
        Container(
          height: 50,
        ),
        Container(
          child: TextField(
            controller: _emailFilter,
            decoration: InputDecoration(
              labelText: 'Email'
            ),
          ),
        ),
        Container(
          child: TextField(
            controller: _passwordFilter,
            decoration: InputDecoration(
              labelText: 'Passwort'
            ),
            obscureText: true,
          ),
        ),
        Container(
          height: 20,
        )
      ],
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Login'),
            onPressed: (){
              Navigator.pushNamed(context, 'homescreen');
              // _loginPressed,
            }
          ),
          Container(
            height: 150,
          ),
          FlatButton(
            child: Text('Passwort vergessen?'),
            onPressed: _passwordReset,
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Account erstellen'),
            onPressed: _createAccountPressed,
          ),
          FlatButton(
            child: Text('Keinen Account? Klicken sie hier um sich zu regisitrieren'),
            onPressed: _formChange,
          )
        ],
      );
    }
  }

  void _loginPressed () async{
    print('The user wants to login with $_email and $_password');

    String url = "localhost:4000/login";

    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": $_email, "password": $_password}';

    http.Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;

    String body = response.body;

    if(body == "true" && statusCode == 200){
      Navigator.pushNamed(context, 'homescreen');
    }
  }

  void _createAccountPressed () {
    print('The user wants to create an accoutn with $_email and $_password');
  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }

}