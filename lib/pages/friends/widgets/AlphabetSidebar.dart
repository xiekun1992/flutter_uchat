import 'package:flutter/material.dart';

class AlphabetSidebar extends StatelessWidget {
  final List<String> alphabet;
  final int currentCharIndex;
  AlphabetSidebar({this.alphabet, this.currentCharIndex});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent,
      child: Column(
          children: alphabet.map((char) {
        return Container(
          width: 20,
          alignment: Alignment.center,
          child: Container(
            height: 16,
            width: 16,
            margin: EdgeInsets.only(bottom: 2),
            alignment: Alignment.center,
            decoration:
                currentCharIndex != -1 && alphabet[currentCharIndex] == char
                    ? BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10))
                    : null,
            child: Text(
              char,
              style: TextStyle(
                  fontSize: 12,
                  color: currentCharIndex != -1 &&
                          alphabet[currentCharIndex] == char
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        );
      }).toList()),
    );
  }
}
