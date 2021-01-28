import 'package:flutter/material.dart';
import 'package:get_flutter/widget/StateManager.dart';
import 'package:get_flutter/widget/ease_import.dart';

import 'widget/getx_controller.dart';

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
  {
    "id": 4,
    "name": "Navigation By Name ",
    "file": NamedRoutes(),
  },
  {
    "id": 5,
    "name": "Navigation By Name And Optional Value",
    "file": NamedRoutes(),
  },
  {
    "id": 6,
    "name": "Reactive State Manager",
    "file": StateManagerPage(),
  },
  {
    "id": 7,
    "name": "GetXController",
    "file": GetXController(),
  },
];
