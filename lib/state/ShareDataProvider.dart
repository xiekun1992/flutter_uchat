import 'package:flutter/material.dart';

class ShareDataProvider extends InheritedWidget {
  final bool showAppBar;
  final Widget child;
  ShareDataProvider({this.showAppBar, this.child});

  static ShareDataProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
