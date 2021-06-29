import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App 01'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('click'),
        ),
      ),
    )
);