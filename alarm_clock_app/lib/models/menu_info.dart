import 'package:flutter/foundation.dart';

import '../enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuInfo(this.menuType , {this.title ,this.imageSource});

  MenuType menuType;
  String? title;
  String? imageSource;

  void updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}