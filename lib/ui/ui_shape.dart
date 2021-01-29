import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_flutter/util/hole_shape_border.dart';

class ShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Material(
        color: Colors.orangeAccent,
        shape: HoleShapeBorder(size: 20, offset: Offset(0.98, 0.4)),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 80,
          child: Text(
            "UnderlineInputBorder",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: HoleShapeBorder(size: 20, offset: Offset(0.98, 0.9))),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 80,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(10),
                //     topLeft: Radius.circular(10),
                //     bottomLeft: Radius.circular(10),
                // ),
                // border: Border.all(color: Colors.white,width: 0.1),
              color: Colors.indigoAccent.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.5, 1.5), //阴影xy轴偏移量
                  blurRadius: 10.0, //阴影模糊程度
                  spreadRadius: 1.0, //阴影扩散程度
                ),
              ]
            ),
            child: Text(
              "CumShape",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),

      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

          ],
        ),
      )
    ]);
  }
}
