import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uchat/components/TopBarView.dart';
import 'package:uchat/pages/chat/chat.dart';

class Messages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessagesState();
  }
}

class _MessagesState extends State<Messages>
    with AutomaticKeepAliveClientMixin {
  TapDownDetails _tapDownDetails;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return TopBarView(
      title: 'uchat',
      page: Stack(children: <Widget>[
        ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTapDown: (TapDownDetails detail) {
                _tapDownDetails = detail;
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Chat(title: '这是一条信息 ${index}');
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
                      Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, right: 10),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: Image(
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/hotel1.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Container(
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '这是一条信息 ${index}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '这是一条信息的具体内容，这是一条信息的具体内容',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        alignment: Alignment.topRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '10:40',
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
