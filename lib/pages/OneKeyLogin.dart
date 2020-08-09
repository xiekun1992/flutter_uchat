import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:uchat/pages/OtherWayLogin.dart';
import 'package:uchat/pages/private/PrivatePolicy.dart';
import 'package:uchat/pages/private/UserProtocol.dart';

import '../utils.dart';
import 'home.dart';

class OneKeyLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OneKeyLoginState();
  }
}

class _OneKeyLoginState extends State<OneKeyLogin> {
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
    // TODO: implement build
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: AssetImage('assets/images/hotel2.jpg'),
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Container(
            color: Colors.black54,
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _mobileNumber,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  Loading.showLoading(context);
                  Future.delayed(Duration(seconds: 3)).then((value) {
                    Loading.hideLoading(context);
                    Navigator.pushReplacement(
                        context, createPageSlideRoute(Home()));
                  });
                },
                child: Text(
                  '本机号码一键登录',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OtherWayLogin()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '其他号码登录',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          child: Row(
            children: <Widget>[
              Text(
                '登录注册代表你已同意',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserProtocol()));
                },
                child: Text(
                  '用户协议',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
              Text(
                '和',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PrivatePolicy()));
                },
                child: Text(
                  '隐私政策',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
