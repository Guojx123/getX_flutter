import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'snake.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({Key key}) : super(key: key);

  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  static const int _snakeRows = 20;
  static const int _snakeColumns = 20;
  static const double _snakeCellSize = 10.0;

  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final accelerometer = _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final gyroscope = _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final userAccelerometer =
        _userAccelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black38),
            ),
            child: SizedBox(
              height: _snakeRows * _snakeCellSize,
              width: _snakeColumns * _snakeCellSize,
              child: Snake(
                rows: _snakeRows,
                columns: _snakeColumns,
                cellSize: _snakeCellSize,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('加速度计: $accelerometer'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('用户加速度计: $userAccelerometer'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('陀螺仪: $gyroscope'),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      gyroscopeEvents.listen(
        (GyroscopeEvent event) {
          setState(() {
            _gyroscopeValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            _userAccelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }
}
