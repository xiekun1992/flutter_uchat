import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:uchat/pages/ModifyPasword.dart';
import 'package:uchat/pages/signup.dart';

import '../utils.dart';
import 'home.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SigninState();
  }
}

class _SigninState extends State<Signin> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = await MobileNumber.mobileNumber;
      _simCard = await MobileNumber.getSimCards;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double padding = MediaQuery.of(context).size.width * 0.1;
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('assets/images/1.png'),
                    width: 80,
                    height: 80,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 40, left: padding, right: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            hintText: '请输入手机号'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
//                          counterStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                            ),
                            hintText: '请输入密码'),
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        },
                        child: Text(
                          '登录',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Text('用户注册'),
                  onTap: () {
                    Navigator.of(context).push(createPageSlideRoute(Signup()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('|'),
                ),
                GestureDetector(
                  child: Text('修改密码'),
                  onTap: () {
                    Navigator.of(context)
                        .push(createPageSlideRoute(ModifyPassword()));
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
