import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              SizedBox(
                height: 180,
                child: Swiper(itemCount: 3,itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(15),
                    height: 150,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        'Slide $index',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  );
                  // 自动轮播
                },
                    autoplay: true
                ),
              )
            ]
          )
      )
    );
  }
}