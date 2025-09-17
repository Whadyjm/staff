// lib/features/auth/presentation/login_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String role = "empleado"; // valor por defecto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: role,
              items: const [
                DropdownMenuItem(value: "empleado", child: Text("Empleado")),
                DropdownMenuItem(value: "admin", child: Text("Administrador")),
              ],
              onChanged: (value) {
                setState(() {
                  role = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (role == "empleado") {
                  context.go("/employee");
                } else {
                  context.go("/admin");
                }
              },
              child: const Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}
