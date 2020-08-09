import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chat extends StatefulWidget {
  final String title;
  Chat({this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatState();
  }
}

class _ChatState extends State<Chat> {
  bool keyboardInput = true;
  bool showIcons = false;
  @override
  Widget build(BuildContext context) {
    Widget _buildInput() {
      return Column(
        children: <Widget>[
          Container(
            height: 54,
            decoration: BoxDecoration(color: Colors.black12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      keyboardInput ? Icons.keyboard_voice : Icons.keyboard,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        keyboardInput = !keyboardInput;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: keyboardInput
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          // padding: EdgeInsets.only(bottom: 10, left: 10),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black26,
                                  style: BorderStyle.solid)),
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                    // borderSide: BorderSide(
                                    // style: BorderStyle.none
                                    // ),
                                    ),
                                hintText: '说点什么'),
                            onTap: () {
                              setState(() {
                                showIcons = true;
                              });
                            },
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: InkWell(
                            child: Center(
                              child: Text('按下说话，松开后发送'),
                            ),
                            onTap: () {
                              print('ontap');
                            },
                            onTapDown: (TapDownDetails tapDownDetails) {
                              print('ontapdown');
                            },
                            onTapCancel: () {
                              print('ontapcancel');
                            },
                          ),
                        ),
                ),
                Container(
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.sentiment_satisfied,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        showIcons = !showIcons;
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      });
                    },
                  ),
                ),
                Container(
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30,
                    ),
                    // icon: Text('dddd'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          showIcons
              ? Container(
                  height: 300,
                  child: Text('data'),
                )
              : SizedBox.shrink(),
        ],
      );
    }

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            showIcons = false;
          });
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: index % 2 == 0
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: <Widget>[
                          index % 2 == 0
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: Image(
                                    width: 50,
                                    height: 50,
                                    image:
                                        AssetImage('assets/images/hotel2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 280),
                                        margin:
                                            EdgeInsets.only(right: 10, top: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreen,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        )),
                                  ],
                                ),
                          index % 2 == 0
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 280),
                                        margin:
                                            EdgeInsets.only(left: 10, top: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            '啊啊啊啊啊啊啊啊',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        )),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: Image(
                                    width: 50,
                                    height: 50,
                                    image:
                                        AssetImage('assets/images/hotel2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              _buildInput(),
            ],
          ),
        ),
      ),
    );
  }
}
