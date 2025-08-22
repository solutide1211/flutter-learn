import 'package:flutter/material.dart';

class WidgetLifeCyclePage extends StatefulWidget{
  const WidgetLifeCyclePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WidgetLifeCyclePage();
  }
}

class _WidgetLifeCyclePage extends State<WidgetLifeCyclePage> {
  int _count = 0;
  @override
  void initState() {
    print("---initState---");
    super.initState();
  }


  @override
  void didChangeDependencies() {
    print("---didChangeDependencies---");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("---build---");
    return Scaffold(
      appBar: AppBar(
        title: Text("这是flutter生命周期"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: MaterialButton(onPressed: (){
              setState(() {
                print("---setState---");
                _count += 1;
              });
            }),
          ),
          Text('$_count',style: TextStyle(fontSize: 25))
        ],
      )
    );
  }

  @override
  void didUpdateWidget(WidgetLifeCyclePage oldWidget) {
    print("---didUpdateWidget---");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("---deactivate---");
    super.deactivate();
  }

  @override
  void dispose() {
    print("---dispose---");
    super.dispose();
  }
}