import 'dart:math';
import 'package:flutter/widgets.dart';

import 'device_type.dart';

class UI {
  static MediaQueryData _mediaQueryData;
  static double width;
  static double height;
  static double horizontal;
  static double vertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeWidth;
  static double safeHeight;

  static bool isTablet;
  static double diagonal;

  static bool xxs;
  static bool xs;
  static bool sm;
  static bool md;
  static bool xmd;
  static bool lg;
  static bool xl;
  static bool xlg;
  static bool xxlg;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initChecks(_mediaQueryData);

    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    horizontal = width / 100;
    vertical = height / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (width - _safeAreaHorizontal);
    safeHeight = (height - _safeAreaVertical);
  }

  static initChecks(MediaQueryData query) {
    var size = query.size;
    diagonal = sqrt((size.width * size.width) + (size.height * size.height));
    debugPrint('设备屏幕信息：\n'
        'size(屏幕尺寸): ${size.width.round()}x${size.height.round()}\n'
        'pixelRatio(像素比率/像素密度): ${query.devicePixelRatio}\n'
        'pixels（物理像素）: ${size.width * query.devicePixelRatio}x${size.height * query.devicePixelRatio}\n'
        'diagonal（对角线像素数）: $diagonal\n'
        'Device.get().isTablet ${Device.get().isTablet}\n'
        'Device.get().isIphoneX ${Device.get().isIphoneX}');
    isTablet = diagonal > 900.0 && Device.get().isTablet;
    xxs = size.width > 300;
    xs = size.width > 360;
    sm = size.width > 480;
    md = size.width > 600;
    xmd = size.width > 720;
    lg = size.width > 980;
    xl = size.width > 1160;
    xlg = size.width > 1400;
    xxlg = size.width > 1700;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData;

  static Size getSize() => _mediaQueryData.size;
}
