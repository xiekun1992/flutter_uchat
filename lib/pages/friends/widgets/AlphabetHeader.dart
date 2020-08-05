import 'package:flutter/material.dart';

class AlphabetHeader extends StatelessWidget {
  final GlobalKey globalKey;
  final String char;
  AlphabetHeader({this.globalKey, this.char});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverFixedExtentList(
      key: globalKey,
      itemExtent: 40,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
            color: Colors.black12,
            child: Text(
              char,
              style: TextStyle(fontSize: 18),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}
