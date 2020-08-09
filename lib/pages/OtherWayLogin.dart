import 'package:flutter/material.dart';

class OtherWayLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtherWayLoginState();
  }
}

class _OtherWayLoginState extends State<OtherWayLogin> {
  Future<bool> showErrorDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('请输入正确的手机号'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('确定')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            '其他号码登录',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10)),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: () async {
//                    Navigator.pushReplacement(
//                        context, createPageSlideRoute(Home()));
                    await showErrorDialog();
                  },
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
