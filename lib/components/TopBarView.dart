import 'package:flutter/material.dart';
import 'package:uchat/pages/friends/add_friends.dart';

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
        height: 76,
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddFriends()));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 34,
                ))
          ],
        ),
      ),
      Expanded(
        child: page,
      )
    ]));
  }
}
