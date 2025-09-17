import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Ver Solicitudes',
        'icon': Icons.pending_actions,
        'route': '/admin/requests'
      },
      {
        'title': 'Gestión de Empleados',
        'icon': Icons.people,
        'route': '/admin/employees'
      },
      {
        'title': 'Calendario de Ausencias',
        'icon': Icons.calendar_month,
        'route': '/admin/absence-calendar'
      },
      {
        'title': 'Generar Informes',
        'icon': Icons.analytics,
        'route': '/admin/reports'
      },
      {
        'title': 'Configuración del Sistema',
        'icon': Icons.settings,
        'route': '/admin/settings'
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Panel de Administrador',
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
                return InkWell(
                  onTap: () {
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
              },
            ),
          ),
        ],
      ),
    );
  }
}