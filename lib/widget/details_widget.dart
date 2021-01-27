import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {

  final String title;
  final Widget widget;

  const DetailsWidget({Key key, this.title, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(title),
        centerTitle: true,
      ),
      body: widget,
    );
  }
}
