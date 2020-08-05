import 'package:flutter/material.dart';

import 'package:uchat/pages/friends/friends.dart';
import 'package:uchat/pages/me/me.dart';
import 'package:uchat/pages/messages/messages.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex;
  List<Widget> _pages;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _pages = List()..add(Messages())..add(Friends())..add(Me());
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: showAppBar
//          ? AppBar(
//              elevation: 0,
//              title: Text('xchat'),
//              actions: <Widget>[
//                PopupMenuButton(
//                  onSelected: (index) {
//                    // SystemChrome.setEnabledSystemUIOverlays([]);
//                    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//                    //   statusBarColor: Colors.black87,
//                    // ));
//                    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//                    print('object');
//                  },
//                  icon: Icon(
//                    Icons.add,
//                    size: 30,
//                  ),
//                  offset: Offset(0, AppBar().preferredSize.height),
//                  itemBuilder: (BuildContext context) {
//                    return [
//                      PopupMenuItem(
//                        value: 1,
//                        child: Row(
//                          children: <Widget>[
//                            Icon(
//                              Icons.line_weight,
//                              color: Colors.black54,
//                            ),
//                            SizedBox(
//                              width: 10,
//                            ),
//                            Text('扫一扫'),
//                          ],
//                        ),
//                      ),
//                      PopupMenuItem(
//                        value: 1,
//                        child: Row(
//                          children: <Widget>[
//                            Icon(
//                              Icons.add_circle_outline,
//                              color: Colors.black54,
//                            ),
//                            SizedBox(
//                              width: 10,
//                            ),
//                            Text('添加好友'),
//                          ],
//                        ),
//                      ),
//                    ];
//                  },
//                )
//              ],
//            )
//          : null,
      body: PageView.builder(
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _controller,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _controller.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Icon(Icons.message),
                    Positioned(
                      top: -4,
                      right: -14,
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '14',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text('消息')),
          BottomNavigationBarItem(
              icon: Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Icon(Icons.people),
                    Positioned(
                      top: -4,
                      right: -14,
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text('联系人')),
          BottomNavigationBarItem(
              icon: Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Icon(Icons.person),
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 8,
                        height: 8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text('我')),
        ],
      ),
    );
  }
}
