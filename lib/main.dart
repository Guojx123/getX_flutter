import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_flutter/common/unknown_route_page.dart';
import 'package:get_flutter/intl/i18n.dart';
import 'package:get_flutter/widget/next_screen.dart';
import 'package:get_flutter/widget/some_value_page.dart';

import 'common/scroll__behavior.dart';
import 'demo_list.dart';
import 'service/service.dart';
import 'widget/details_widget.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print("Start Service ");
  await Get.putAsync<Service>(() async => Service());
  print("All Service Started");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q&A',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetMaterialApp(
        translations: Messages(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        getPages: [
          GetPage(
              name: "/nextScreen",
              page: () => NextScreen(),
              transition: Transition.rightToLeft),
          GetPage(
              name: "/someValue/:value",
              page: () => SomeValuePage(),
              transition: Transition.rightToLeft),
        ],
        unknownRoute:
            GetPage(name: "/notFound", page: () => UnKnownRoutePage()),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[200],
            title: Text("GetX Demo"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ScrollConfiguration(
                    behavior: OverScrollBehavior(),
                    child: ListView.builder(
                        itemCount: demoList.length,
                        itemBuilder: (context, index) {
                          List<Demo> _demoList = demoList
                              .map(
                                (item) => Demo(
                                  id: item['id'],
                                  name: item['name'],
                                  file: item['file'],
                                ),
                              )
                              .toList();
                          var item = _demoList[index];
                          return _buildListItem(item);
                        }),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildListItem(Demo item) {
    return ListTile(
      title: Text(item.name),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
      ),
      onTap: () => Get.to(DetailsWidget(
        title: item.name,
        widget: item.file,
      )),
    );
  }
}
