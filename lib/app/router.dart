// lib/app/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:staff/features/admin/admin_homepage.dart';
import 'package:staff/features/auth/login_page.dart';
import 'package:staff/features/auth/splash_page.dart';
import 'package:staff/features/employee/employee_homepage.dart';

final router = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(path: "/splash", builder: (context, state) => const SplashPage()),
    GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
    GoRoute(
      path: "/employee",
      builder: (context, state) => const EmployeeHomePage(),
    ),
    GoRoute(path: "/admin", builder: (context, state) => const AdminHomePage()),
  ],
);
