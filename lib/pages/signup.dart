import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).padding.top + 80,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios)),
            ),
            Text(
              '用户注册',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Text('signup'),
      ],
    ));
  }
}
