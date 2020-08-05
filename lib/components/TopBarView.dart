import 'package:flutter/material.dart';

class TopBarView extends StatelessWidget {
  final Widget page;
  final String title;
  TopBarView({this.page, this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 10, right: 10),
        height: 80,
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: page,
      )
    ]));
  }
}
