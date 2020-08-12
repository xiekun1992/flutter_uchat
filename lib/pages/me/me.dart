import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeState();
  }
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 180 + MediaQuery.of(context).padding.top,
          color: Colors.blue,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
//                    border: Border(
//                      bottom: BorderSide(
//                          color: Colors.black12,
//                          width: 1,
//                          style: BorderStyle.solid),
//                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                height: 80,
              ),
              Positioned(
                left: 30,
                bottom: 40,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      width: 80,
                      height: 80,
                      image: AssetImage('assets/images/paris.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 44,
                  left: 130,
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ordinary',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(Icons.line_weight)
                        ]),
                  ))
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                color: Colors.white,
                padding: EdgeInsets.zero,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Settings',
                                style: TextStyle(fontSize: 18),
                              ))),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FlatButton(
                    onPressed: () {},
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '退出账号',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
