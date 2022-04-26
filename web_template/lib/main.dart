import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:web_template/utils/setup_app.dart';
import 'presentation/route.dart';
import 'presentation/theme.dart';

void main() {
  setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Name",
      theme: AppTheme.theme,
      onGenerateRoute: AppRoute.onGenerateRoute,
      onGenerateInitialRoutes: AppRoute.onGenerateInitialRoute,
      initialRoute: AppRoute.initial,
    );
  }
}