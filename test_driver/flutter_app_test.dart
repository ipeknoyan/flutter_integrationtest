// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
// Imports the Utilities
import 'Utils.dart';

void main() {
  group('Music App Integration Tests', () {
  late FlutterDriver driver;

  //call the utils classes
  final objFind = ElementFinders();
  final keywords= Keywords();

  // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
        driver.close();
    });

    test('Verify Is App Opened', () async {
      await Future.delayed(const Duration(milliseconds: 5), () {});
      if (await keywords.isExist("Music App",driver)) {
        return true;
      }
      await driver.waitFor(find.text("Music App"));
    });

    test('Search an existing album', () async {
      if (await keywords.isExist("Music App",driver)) {
      await driver.tap(objFind.searchIcon);
    }
      await driver.tap(objFind.searchTextbox);
      await driver.enterText("John Lennon");
      await Future.delayed(const Duration(seconds: 2), () {});
      //await driver.tap(searchIcon);
    });
  });
}
