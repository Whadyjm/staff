// lib/features/admin/presentation/admin_home_page.dart
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administrador")),
      body: ListView(
        children: const [
          ListTile(title: Text("Ver solicitudes")),
          ListTile(title: Text("Calendario de ausencias")),
          ListTile(title: Text("Generar informe")),
        ],
      ),
    );
  }
}
