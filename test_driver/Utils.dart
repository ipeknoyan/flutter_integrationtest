// To run the integration tests
// Execute "flutter driver --target=test_driver/flutter_app.dart --driver=test_driver/flutter_app_test.dart"

import 'package:flutter_driver/flutter_driver.dart';
//Define elements
class ElementFinders{
  final searchIcon = find.byType('Icon');
  final searchTextbox = find.byType("AppBar");
}

//Define reusable functions
class Keywords{

    Future<bool> isExist(Text, driver,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver.waitFor(find.text(Text), timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

}