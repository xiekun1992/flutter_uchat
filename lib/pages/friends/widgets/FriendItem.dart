import 'package:flutter/material.dart';
import 'package:uchat/pages/chat/chat.dart';

class FriendItem extends StatefulWidget {
  final String char;
  FriendItem({this.char});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FriendItemState();
  }
}

class _FriendItemState extends State<FriendItem> {
  TapDownDetails _tapDownDetails;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverFixedExtentList(
      itemExtent: 70,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTapDown: (TapDownDetails details) {
              _tapDownDetails = details;
            },
            onLongPress: () {
              final RenderBox overlay =
                  Overlay.of(context).context.findRenderObject();
              showMenu(
                  context: context,
                  position: RelativeRect.fromRect(
                      _tapDownDetails.globalPosition & Size(0, 0),
                      Offset.zero & overlay.size),
                  items: <PopupMenuEntry>[PopupMenuItem(child: Text('删除'))]);
            },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Chat(title: 'demo');
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xdddddddd),
                            width: 1))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image(
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/hotel1.jpg'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '这是一条信息 ${index}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}
