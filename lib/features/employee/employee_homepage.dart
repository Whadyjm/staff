// lib/features/employee/presentation/employee_home_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployeeHomePage extends StatelessWidget {
  const EmployeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Solicitar Vacaciones',
        'icon': Icons.card_travel,
        'route': '/employee/vacation-request'
      },
      {
        'title': 'Solicitar Permiso',
        'icon': Icons.event_note,
        'route': '/employee/permission-request'
      },
      {
        'title': 'Cambio de Turno',
        'icon': Icons.swap_horiz,
        'route': '/employee/shift-change'
      },
      {
        'title': 'Consultar Días Disponibles',
        'icon': Icons.calendar_today,
        'route': '/employee/available-days'
      },
      {
        'title': 'Mis Documentos',
        'icon': Icons.folder_open,
        'route': '/employee/my-documents'
      },
      {
        'title': 'Reportar Incidente',
        'icon': Icons.warning_amber,
        'route': '/employee/report-incident'
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Menú de Empleado',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(20),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              context.go("/login");
            },
          )
        ],
      ),
      body: Stack(
        children: [
          /*Positioned.fill(
            child: Image.network(
              '',
              fit: BoxFit.cover,
            ),
          ),*/
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withAlpha(100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return _buildGridItem(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        // context.go(item['route']);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(20),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'],
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              item['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}