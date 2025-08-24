import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  String? name;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      // 静态路由传值：
      // 1. 在 initState 中传值，不能调用 ModalRoute.of(context) 必须延迟到下一帧
      // WidgetsBinding.instance.addPostFrameCallback
      //2. 在 didChangeDependencies 中传值，但是会出现父组件更新造成该组件更新，
      // 所以可以添加标志位，进行限制
      var map  = ModalRoute.of(context)?.settings.arguments;
      if(map is Map){
        name = map["name"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文章"),
      ),
      body: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.green),
        child: Text("home页面路由传值：$name",style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
