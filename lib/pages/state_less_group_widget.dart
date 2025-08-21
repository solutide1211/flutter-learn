import 'package:flutter/material.dart';

class StatelessGroupWidget extends StatelessWidget {
  const StatelessGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle ts = TextStyle(color: Colors.lightBlue);
    return Scaffold(
        appBar: AppBar(
          title: Text("appBar", style: ts),
          centerTitle: true,
          shadowColor: Colors.lightBlue,
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(color: Colors.black12),
            child: Column(children: [
              Icon(
                Icons.android,
                color: Colors.amberAccent,
                size: 90,
              ),
              CloseButton(),
              BackButton(),
              Chip(label: Text("学习flutter"), backgroundColor: Colors.black),
              Divider(
                thickness: 10,
                color: Colors.deepOrange,
              ),
              Card(
                child: Text(
                  "这是card",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              AlertDialog(
                title: Text("这是弹窗"),
              )
            ]),
          ),
        ));
  }
}
