import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gmail clone'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        children: <Widget>[
          Text('hello,world'),
          FlatButton(
            onPressed: () {},
            color: Colors.amber,
            child: Text('click me'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "click+",
        ),
        onPressed: null,
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
