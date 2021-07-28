import 'package:flutter/material.dart';
import 'package:get_flutter/util/ui/app_dimensions.dart';

class UIAdaptation extends StatefulWidget {
  const UIAdaptation({Key key}) : super(key: key);

  @override
  _UIAdaptationState createState() => _UIAdaptationState();
}

class _UIAdaptationState extends State<UIAdaptation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.tealAccent,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: AppDimensions.ratio * 100,
          height: AppDimensions.ratio * 100,
          color: Colors.tealAccent,
        ),
      ],
    );
  }
}
