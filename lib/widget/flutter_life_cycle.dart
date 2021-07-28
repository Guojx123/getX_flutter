import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FlutterLifeCycle extends StatefulWidget {
  const FlutterLifeCycle({Key key}) : super(key: key);

  @override
  _FlutterLifeCycleState createState() => _FlutterLifeCycleState();
}

class _FlutterLifeCycleState extends State<FlutterLifeCycle> with WidgetsBindingObserver{

  ///  Flutter生命周期
  ///  resumed:应用可见并可响应用户操作
  ///  inactive:用户可见，但不可响应用户操作
  ///  paused:已经暂停了，用户不可见、不可操作
  ///  suspending：应用被挂起，此状态IOS永远不会回调

  @override
  void initState() {
    super.initState();
    // 添加观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('应用生命周期发生变化 : $state');
  }

  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    print('是否更改了辅助功能');
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    print('低内存时回调');
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
    print('用户本地设置变化时调用，如系统语言改变 : ${locale.first.languageCode}');
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance.window.physicalSize;
    print('didChangeMetrics  ：宽：${size.width} 高：${size.height}');
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    print('是否修改了亮度');
  }

  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
    super.didChangeTextScaleFactor();
    print('是否改变了文字大小');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 销毁观察者
    WidgetsBinding.instance.removeObserver(this);
  }
}
