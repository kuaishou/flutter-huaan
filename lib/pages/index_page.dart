import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_swiper/flutter_swiper.dart";

import './home_page.dart';
import './tool_page.dart';
import './study_page.dart';
import './my_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('工具')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('学习')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('我的'))
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    ToolPage(),
    StudyPage(),
    MyPage()
  ];

  int currentIndex=0;
  var currentPage;
@override
void initState() { 
  currentPage=tabBodies[currentIndex];
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
         onTap: (index) {
           setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
            }
      ),
      body: currentPage,
    );
  }
}

