import 'package:code01/Routes/RouteManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyappPage());
}

class MyappPage extends StatefulWidget {
  const MyappPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyappPageState();
  }
}

class MyappPageState extends State<MyappPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由跳转",
      initialRoute: RoutePath.HOME,
      theme: ThemeData(useMaterial3: true),
      // 注册路由生成器
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}




