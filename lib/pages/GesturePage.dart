import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return GesturePageState();
  }
}

class GesturePageState extends State<GesturePage> {
  String msg = "";
  double modelX = 0;
  double modelY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureDetector示例'),
        ),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => printString('点击'),
              onDoubleTap: () => printString("双击"),
              onLongPress: () => printString("长安"),
              child: Container(
                color: Colors.blueGrey,
                width: double.infinity, // 宽度充满屏幕
                height: double.infinity,
              ),
            ),
            Positioned(
                left: modelX,
                top: modelY,
                child: GestureDetector(
                  onPanUpdate: (e) => doMove(e),
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(36)
                    ),
                  ),
                )
            )
          ],
        ));
  }

  void printString(String msg) {
    setState(() {
      msg += ", $msg";
      print(msg);
    });
  }
  void doMove(DragUpdateDetails  event) {
    setState(() {
      modelX += event.delta.dx;
      modelY += event.delta.dy;
      print(modelX + modelY);
    });
  }
}
