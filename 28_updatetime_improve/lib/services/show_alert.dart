import 'package:flutter/material.dart';

//警告框效果
Future<void> showAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('您已離線'),
        content: const Text('請連上網路後再次嘗試.....'),
        actions: <Widget>[
          FlatButton(
            child: Text('確定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}