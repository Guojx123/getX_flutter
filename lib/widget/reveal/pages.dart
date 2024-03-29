import 'package:flutter/material.dart';

final pages = [
  PageViewModel(
      const Color(0xFF678FB4),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'
  ),
  PageViewModel(
      const Color(0xFF65B0B4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'
  ),
  PageViewModel(
    const Color(0xFF9B90BC),
    'assets/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/shopping_cart.png',
  ),
  PageViewModel(
    const Color(0xFFF08080),
    'assets/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/shopping_cart.png',
  ),
  PageViewModel(
      const Color(0xFFCECE96),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'
  ),
  PageViewModel(
      const Color(0xFFA95858),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'
  ),
];

class PageControl extends StatelessWidget {
  PageControl({this.pageViewModel, this.percentVisible = 1.0});

  final PageViewModel pageViewModel;
  final double percentVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 改变组件竖直方向的位置
            Transform(
              transform: Matrix4.translationValues(0.0, 25.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Image.asset(
                  pageViewModel.heroAssetPath,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 15.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0, top: 10.0),
                child: Text(
                  pageViewModel.title,
                  style: TextStyle(color: Colors.white, fontFamily: "FlamanteRoma", fontSize: 34.0),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 15.0 * (1.0 - percentVisible), 0.0),
              child: Text(
                pageViewModel.body,
                style: TextStyle(color: Colors.white, fontFamily: "FlamanteRoma"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body, this.iconAssetIcon);
}