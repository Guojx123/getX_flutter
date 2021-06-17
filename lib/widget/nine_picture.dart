import 'package:flutter/material.dart';

class NinePicture extends StatefulWidget {
  const NinePicture({Key key}) : super(key: key);

  @override
  _NinePictureState createState() => _NinePictureState();
}

class _NinePictureState extends State<NinePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              constraints: BoxConstraints(
                maxWidth: 320,
                maxHeight: 500,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      centerSlice: Rect.fromLTWH(10, 1, 10, 5),
                      image: AssetImage(
                        'assets/dialog.png',
                      ),
                      fit: BoxFit.fill)),

          ),
        ],
      ),
    );
  }
}
