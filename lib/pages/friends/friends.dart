import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uchat/components/TopBarView.dart';
import 'package:uchat/pages/friends/widgets/AlphabetHeader.dart';
import 'package:uchat/pages/friends/widgets/AlphabetSidebar.dart';
import 'package:uchat/pages/friends/widgets/FriendItem.dart';

class Friends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FriendsState();
  }
}

class _FriendsState extends State<Friends> with AutomaticKeepAliveClientMixin {
  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '#'
  ];
  List<GlobalKey> keys = [];
  List<Widget> slivers = [];

  int currentCharIndex = -1;

  int findCharIndex(height) {
    double charHeight = 486 / alphabet.length;
    int offset = (height / charHeight).round();
    if (offset > alphabet.length - 1 || offset < 0) {
      return -1;
    }
    return offset;
  }

  void jump(details) {
    setState(() {
      currentCharIndex = findCharIndex(details.localPosition.dy);
    });
    if (currentCharIndex != -1) {
      final dataKey = keys[currentCharIndex];
      Scrollable.ensureVisible(dataKey.currentContext);
    }
  }

  void hide() {
    setState(() {
      currentCharIndex = -1;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    keys = alphabet.map((e) => new GlobalKey()).toList();
    alphabet.asMap().forEach((index, char) {
      slivers.add(AlphabetHeader(
        globalKey: keys[index],
        char: char,
      ));
      slivers.add(FriendItem(char: char));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return TopBarView(
      title: 'friends',
      page: Container(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            child: CustomScrollView(
              slivers: slivers,
            ),
          ),
          Positioned(
              height: 486,
              width: 20,
              right: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  jump(details);
                },
                onTapUp: (details) {
                  hide();
                },
                onTapCancel: () {
                  hide();
                },
                onPanStart: (details) {
                  jump(details);
                },
                onPanUpdate: (details) {
                  jump(details);
                },
                onPanEnd: (details) {
                  hide();
                },
                onPanCancel: () {
                  hide();
                },
                child: AlphabetSidebar(
                    alphabet: alphabet, currentCharIndex: currentCharIndex),
              )),
          Visibility(
            visible: currentCharIndex != -1,
            child: Positioned(
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black45),
                child: Text(
                  currentCharIndex != -1 ? alphabet[currentCharIndex] : '',
                  style: TextStyle(
                      fontSize: 40,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
//          currentCharIndex != -1 ? Positioned(
//            child: Container(
//              width: 60,
//              height: 60,
//              alignment: Alignment.center,
//              // padding: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(4),
//                  color: Colors.black45
//              ),
//              child: Text(
//                alphabet[currentCharIndex],
//                style: TextStyle(
//                    fontSize: 40,
//                    // fontWeight: FontWeight.bold,
//                    color: Colors.white
//                ),
//              ),
//            ),
//          ) : SizedBox.shrink(),
        ]),
      ),
    );
  }
}
