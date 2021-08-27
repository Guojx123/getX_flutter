import 'package:flutter/material.dart';

class NinePicture extends StatefulWidget {
  const NinePicture({Key key}) : super(key: key);

  @override
  _NinePictureState createState() => _NinePictureState();
}

class _NinePictureState extends State<NinePicture> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('+86'),
                        Text('I'),
                      ],
                    ),
                    hintText: '电话号码',
                    fillColor: Colors.deepOrange,
                    filled: true,
                  ),
                  validator: (value) {
                    RegExp reg = new RegExp(r'^\d{11}$');
                    if (!reg.hasMatch(value)) {
                      return '请输入11位手机号码';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '用户名',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('提交'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('提交成功...'),
                      ));
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Container(
  //           constraints: BoxConstraints(
  //             maxWidth: 320,
  //             maxHeight: 500,
  //           ),
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   centerSlice: Rect.fromLTWH(10, 1, 10, 5),
  //                   image: AssetImage(
  //                     'assets/dialog.png',
  //                   ),
  //                   fit: BoxFit.fill)),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
