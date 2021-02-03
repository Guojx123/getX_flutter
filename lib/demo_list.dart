import 'package:flutter/material.dart';
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
  {
    "id": 8,
    "name": "GetX with Controller Type",
    "file": GetXControllerType(),
  },
  {
    "id": 9,
    "name": "GetXController Lifecycle methods",
    "file": GetXControllerLifecycle(),
  },
  {
    "id": 10,
    "name": "GetX Unique ID",
    "file": GetXUniqueID(),
  },
  {
    "id": 11,
    "name": "Understanding GetX Workers",
    "file": GetXWorkers(),
  },
  {
    "id": 12,
    "name": "Implementing Internationalization in Flutter using GetX",
    "file": Internationalization(),
  },
  {
    "id": 13,
    "name": "Dependecy Injection",
    "file": DependencyInjection(),
  },
  {
    "id": 14,
    "name": "GetX Service",
    "file": GetXService(),
  },
  {
    "id": 14,
    "name": "Question ListView",
    "file": QuestionListView(),
  },
];
