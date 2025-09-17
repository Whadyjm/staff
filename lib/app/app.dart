// lib/app/app.dart
import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Personal',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
