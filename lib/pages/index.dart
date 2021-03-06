import 'package:flutter/material.dart';
import 'home/home.dart';
import 'browse/task.dart';
import 'release/task.dart';
import 'mine/mine.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState()  => new IndexState();
}

class IndexState extends State<Index>{
  int _currentIndex = 0;            //当前页面索引
  PageController _pageController = new PageController(initialPage: 0);
  var _pageList = <StatefulWidget>[
    new Home(),
    new RTask(),
    new BTask(),
    new Mine(),
  ];
  Widget build(BuildContext context) {
    /*-----bottom nav start-------*/
    BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, IconData activeIcon, String title, int itemIndex){
      var _bottomNavigationBarColor = Color.fromARGB(255, 166, 166, 166);
      if(_currentIndex == itemIndex){
        _bottomNavigationBarColor = Colors.green;
      }
      return BottomNavigationBarItem(icon: Icon(icon, color: _bottomNavigationBarColor), activeIcon: Icon(activeIcon, color: _bottomNavigationBarColor), title: Text(title, style: TextStyle(color: _bottomNavigationBarColor)));
    }
    BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items: [
        _bottomNavigationBarItem(Icons.home, Icons.home, '首页', 0),
        _bottomNavigationBarItem(Icons.view_list, Icons.filter_list, '试客任务', 1),
        _bottomNavigationBarItem(Icons.camera, Icons.camera, '浏览任务', 2),
        _bottomNavigationBarItem(Icons.person_outline, Icons.person, '我的', 3)
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      fixedColor: Colors.green,
      onTap: (index){
        setState(() {
          _currentIndex = index;      //修改当前页面索引  
          _pageController.jumpToPage(index);
          // _pageController.animateToPage(index,
          //   duration: const Duration(milliseconds: 300), curve: Curves.ease);
        });
      },
    );
    /*-----bottom nav end-------*/
    return new Scaffold(
        // body: _pageList[_currentIndex],
        body: new PageView(
          children: _pageList,
          controller: _pageController,
          onPageChanged: (int index){
            setState(() {
              _currentIndex = index;      //修改当前页面索引 
            });
          }
        ),
        bottomNavigationBar: _bottomNavigationBar,
        resizeToAvoidBottomPadding: false,
      );
  }
}
