import 'package:flutter/material.dart';
import 'package:get_flutter/widget/ease_import.dart';

class Demo {
  final int id;
  final String name;
  final Widget file;

  Demo({this.id, this.name, this.file});
}

List<Map> demoList = [
  {
    "id": 0,
    "name": "SnackBar",
    "file": ShowSnackBar(),
  },
  {
    "id": 1,
    "name": "Dialog",
    "file": ShowDialog(),
  },
  {
    "id": 2,
    "name": "BottomSheet",
    "file": ShowBottomSheet(),
  },
  {
    "id": 3,
    "name": "Navigation",
    "file": NavigationDemo(),
  },
];
