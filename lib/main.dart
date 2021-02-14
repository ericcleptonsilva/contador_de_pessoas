import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Peossoas",
    darkTheme: ThemeData.dark(),
    home: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                "Peddoas: 0",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Pode Entrar!: 0",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 25),
                ))
          ]),
      color: Colors.black,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
