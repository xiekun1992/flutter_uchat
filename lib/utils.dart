import 'package:flutter/material.dart';

Route createPageSlideRoute(StatefulWidget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Loading {
  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future showLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
              color: Colors.black12,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white12,
                  )
                ],
              ));
        });
  }
}
