import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpinnerDialog {
  final BuildContext context;

  SpinnerDialog(this.context);

  void showLoading() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black26,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
            ),
          ),
        ),
      ),
    );
  }

  void hideLoading() {
    Navigator.pop(context);
  }
}
