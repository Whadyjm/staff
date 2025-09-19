import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*final List<Map<String, dynamic>> menuItems = [
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
    ];*/

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.calendar_month_rounded, color: Colors.green),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/staff.png', height: 30,),
            Text('Administrador', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
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
            child: Container(
              color: Colors.black.withAlpha(20),
            ),
          ),
          Center(child: Text('Sin solicitudes.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),))
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
                            Icons.pending_actions,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.people,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.analytics,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
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
                Column(children: [Text('Nombre'), Text('Rol: Administrador')]),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(child: const Text('Configuración')),
            const Divider(),
            GestureDetector(child: const Text('Ver informes')),
            const Divider(),
            GestureDetector(onTap: ()=> context.go('/login'), child: Text('Cerrar sesión')),
          ],
        ),
      ),
    );
  }
}