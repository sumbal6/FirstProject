import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sumbal_churail/sumbal.dart';
import 'auth.dart';

class Splashpage extends StatefulWidget {
  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    Timer(
    
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext contxt) => Login(auth: Auth()))));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
