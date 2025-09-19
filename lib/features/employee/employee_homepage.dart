// lib/features/employee/presentation/employee_home_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployeeHomePage extends StatelessWidget {
  const EmployeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Solicitar Vacaciones',
        'icon': Icons.card_travel,
        'route': '/employee/vacation-request',
      },
      {
        'title': 'Solicitar Permiso',
        'icon': Icons.event_note,
        'route': '/employee/permission-request',
      },
      {
        'title': 'Cambio de Turno',
        'icon': Icons.swap_horiz,
        'route': '/employee/shift-change',
      },
      {
        'title': 'Consultar Días Disponibles',
        'icon': Icons.calendar_today,
        'route': '/employee/available-days',
      },
      {
        'title': 'Mis Documentos',
        'icon': Icons.folder_open,
        'route': '/employee/my-documents',
      },
      {
        'title': 'Reportar Incidente',
        'icon': Icons.warning_amber,
        'route': '/employee/report-incident',
      },
    ];*/

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.calendar_month, color: Colors.green),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/staff.png', height: 30,),
            Text('Empleado', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(20),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => _profilePopUp(context),
                );
              },
              child: const CircleAvatar(radius: 15),
            ),
          ),
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
            child: Container(color: Colors.black.withAlpha(20)),
          ),
          Center(child: Text('No tienes solicitudes por procesar.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),))
          /*Padding(
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
          ),*/
        ],
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.event_note_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.swap_horiz_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item['icon'], size: 50, color: Colors.white),
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

  Widget _profilePopUp(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(radius: 30),
                Column(children: [Text('Nombre'), Text('Matrícula'), Text('Puesto')]),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(child: const Text('Mis documentos')),
            const Divider(),
            GestureDetector(child: const Text('Reportar incidente')),
            const Divider(),
            GestureDetector(onTap: ()=> context.go('/login'), child: Text('Cerrar sesión')),
          ],
        ),
      ),
    );
  }
}
