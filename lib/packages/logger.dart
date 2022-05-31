import 'dart:developer';

import 'package:flutter/material.dart';

import '../basic_template.dart';

final logger = Logger('App');

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    String emoji = '';
    if (record.level == Level.INFO) {
      emoji = 'ℹ️';
    } else if (record.level == Level.WARNING) {
      emoji = '❗️';
    } else if (record.level == Level.SEVERE) {
      emoji = '⛔️';
    }
    final message = '$emoji   ${record.level.name}: ${record.message}';
    // debugPrint(message);
    log(message);
    if (record.error != null) {
      debugPrint('👉 ${record.error}');
    }
    if (record.level == Level.SEVERE) {
      debugPrintStack(stackTrace: record.stackTrace);
    }
  });
}
