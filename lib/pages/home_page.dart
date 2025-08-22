import 'package:code01/Routes/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(children: [
        // 轮播图
        Container(
          height: 200,
          //decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Swiper(
            itemCount: 3,
            indicatorLayout: PageIndicatorLayout.SCALE,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "轮播图$index",
                    style: TextStyle(fontSize: 20, color: Colors.amberAccent),
                  ),
                ),
              );
            },
            autoplay: true,
            // 可选：添加分页指示器
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.white,
                color: Colors.grey,
                size: 15,
                activeSize: 20,
              ),
            ),
          ),
        ),

        // ListView 列表
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, newIndex) {
                  return _ListItemWidget();
                },
                itemCount: 20))
      ])),
    );
  }

  Widget _ListItemWidget() {
    return GestureDetector(
      onTap: (){
        // 跳转到文章页面
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewPage()));
        Navigator.pushNamed(context, RoutePath.WEB_VIEW_PAGE);
      },
      child: Container(
        margin: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, top: 8, right: 15),
                    height: 40,
                    width: 40,
                    child: ClipOval(
                      child: Image.network(
                        "https://pic.netbian.com/uploads/allimg/250819/225037-1755615037565f.jpg",
                        fit: BoxFit.fill,
                      ),
                    )),
                Text("作者",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Expanded(child: SizedBox()),
                Text(
                    "2025-8-22",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(width: 15),
                Text("置顶",style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),),
                SizedBox(width: 15)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5, left: 8, right: 8),
              child: Text(
                "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,bottom: 5),
              child: Row(
                children: [
                  Text("分类",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.bold),),
                  Expanded(child: SizedBox()),
                  Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/collection.png"),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
