import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/pages/login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: CustomColorScheme.primaryButton,
      ),
      home: LoginPageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
