import 'package:flutter/material.dart';

import '../config/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(useMaterial3: true),
      //home:HomeScreenBotomBar(),
    );
  }
}
