// lib/features/employee/presentation/employee_home_page.dart
import 'package:flutter/material.dart';

class EmployeeHomePage extends StatelessWidget {
  const EmployeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Empleado")),
      body: ListView(
        children: const [
          ListTile(title: Text("Solicitar Vacaciones")),
          ListTile(title: Text("Solicitar Permiso")),
          ListTile(title: Text("Cambio de turno")),
          ListTile(title: Text("Consultar días disponibles")),
        ],
      ),
    );
  }
}
