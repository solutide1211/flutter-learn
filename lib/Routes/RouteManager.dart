import 'package:code01/pages/WebViewPage.dart';
import 'package:code01/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class RoutePath {
  static const String HOME = "/home";

  static const String WEB_VIEW_PAGE = "/WebViewPage";
}

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutePath.HOME:
        return pageRoute(HomePage(),setting: setting);
      case RoutePath.WEB_VIEW_PAGE:
        return pageRoute(WebViewPage(),setting: setting);
      default:
        return pageRoute(UnkonwPage());
    }
  }

  static MaterialPageRoute<T> pageRoute<T>(Widget page,{
    RouteSettings? setting,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting
  }){
    return MaterialPageRoute(builder: (context){
      return page;
    },
      settings: setting,
      fullscreenDialog: fullscreenDialog ?? false,
        maintainState:  maintainState ?? true,
        allowSnapshotting: allowSnapshotting ?? true
    );
  }
}





Widget UnkonwPage(){
  return Scaffold(
    appBar: AppBar(title: Text("错误页面"),centerTitle: true),
    body: SafeArea(child: Center(
      child: Text("未知页面"),
    ))
  );
}



