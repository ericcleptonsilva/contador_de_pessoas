import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inforText = "Pode Entrar!";
  int _pessoas = 0;

  void _editePessoas(int delta) {
    setState(() {
      _pessoas += delta;
      if (_pessoas <= 0) {
        inforText = "Fechado!";
      } else if (_pessoas <= 10) {
        inforText = "Pode Entrar!";
      } else {
        inforText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 500,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Pessoas: $_pessoas",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          child: Text(
                            "+1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          onPressed: () {
                            _editePessoas(1);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          child: Text(
                            "-1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          onPressed: () {
                            _editePessoas(-1);
                          },
                        ),
                      )
                    ],
                  ),
                  Text(inforText,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 25)),
                  Divider(),
                  FloatingActionButton(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.auto_delete_outlined),
                      onPressed: () {
                        _editePessoas(_pessoas = 0);
                      })
                ]),
          ],
        )
      ],
    );
  }
}
