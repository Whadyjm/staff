// lib/features/auth/presentation/splash_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go("/login");
    });

    return const Scaffold(
      body: Center(
        child: Text("Gestión de Personal", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
