import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import '../config/const.dart';
import 'dir.dart';

Future<void> takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
}

Future<void> takeNamedScreenshot(FlutterDriver driver, String id) async {
  await createDirIfNotExist(screenshotDir);
  String path = screenshotDir + '/' + id + '.png';
  await takeScreenshot(driver, path);
}

Future<void> prepareScreenshotArea() async {
  await removeDirIfExist(screenshotDir);
  await createDirIfNotExist(screenshotDir);
}
