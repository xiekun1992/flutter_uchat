import 'package:flutter/material.dart';

class AddFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('添加好友'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  hintText: '搜索'),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
//                    onTap: () {
//                      Navigator.of(context)
//                          .push(MaterialPageRoute(builder: (BuildContext context) {
//                        return Chat(title: '这是一条信息 ${index}');
//                      }));
//                    },
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
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 10),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '这是一条信息 ${index}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
//                                  SizedBox(
//                                    height: 8,
//                                  ),
//                                  Text(
//                                    '这是一条信息的具体内容，这是一条信息的具体内容',
//                                    style: TextStyle(
//                                        color: Colors.black45, fontSize: 14),
//                                    overflow: TextOverflow.ellipsis,
//                                  )
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                '加好友',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
