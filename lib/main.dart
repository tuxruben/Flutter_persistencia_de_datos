import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  _changeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      value = value + 1;
      prefs.setInt("value", value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt("value") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Preferences'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  value.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FlatButton(onPressed: _changeValue, child: Text("Amuentar en 1"))
            ],
          ),
        ),
      ),
    );
  }
}
