import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget{
  const LayoutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutPageState();
  }
}

class MyFlowDelegate extends FlowDelegate {
  final double animValue;

  MyFlowDelegate({required this.animValue});

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      dx += i * 20 * animValue; // 动画控制偏移
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx, 0, 0)
          ..rotateZ(animValue * i), // 可加旋转等变换
      );
    }
  }

  @override
  bool shouldRepaint(MyFlowDelegate oldDelegate) {
    return animValue != oldDelegate.animValue;
  }
}


class _LayoutPageState extends State<LayoutPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    // 创建动画控制器
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // SingleTickerProviderStateMixin 提供 vsync
    );

    // 创建插值动画：从 0.0 到 1.0
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // 播放动画（可选：循环播放）
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // 必须释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局组件'),
        titleTextStyle: TextStyle(color: Colors.lightBlue,fontSize: 20,),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(

        children: [
          Stack(
            children: [
              Container(
                height: 50,
                color: Colors.blueGrey,
              ),
              Positioned(
                  right: 20,
                  top: 30,
                  child: Container(
                      height: 40,
                      color: Colors.lightGreenAccent,
                      child: Text("positioned")
                  )
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                color: Colors.lightGreenAccent,
                child: Text("c1"),
              ),
              Container(
                height: 50,
                color: Colors.blueGrey,
                child: Text("c2"),
              ),
              Container(
                height: 50,
                color: Colors.blue,
                child: Text("c3"),
              ),
            ],
          ),
          Wrap(
            children: [
              Chip(label: Text('HTML')),
              Chip(label: Text('CSS')),
              Chip(label: Text('JavaScript')),
              Chip(label: Text('Dart')),
              Chip(label: Text('Flutter')),
              Chip(label: Text('React')),
            ],
          ),
          // Flow 动画组件
          // 修复：给 Flow 一个确定的高度
          SizedBox(
            height: 60, // 根据子元素大小设置
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Flow(
                  delegate: MyFlowDelegate(animValue: _animation.value),
                  children: [
                    Container(width: 40, height: 40, color: Colors.red),
                    Container(width: 40, height: 40, color: Colors.green),
                    Container(width: 40, height: 40, color: Colors.blue),
                    Container(width: 40, height: 40, color: Colors.yellow),
                    Container(width: 40, height: 40, color: Colors.purple),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.red, child: Text("2份")),
              ),
              Expanded(
                flex: 1,
                child: Container(color: Colors.green, child: Text("1份")),
              ),
              Expanded(
                flex: 1,
                child: Container(color: Colors.blue, child: Text("1份")),
              ),
            ],
          )
        ],
      ),
    );
  }
}

