import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import 'package:staff/widgets/dot_matrix_painter.dart'; // Import for math functions like sin and cos

// ... (DotMatrixPainter class as defined above) ...

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _role = "empleado";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      context.go(_role == "empleado" ? "/employee" : "/admin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),*/
          Positioned(
            top: 0,
            right: 0,
            child: AnimatedDotMatrix(
              width: MediaQuery.of(context).size.width,
              height: 300,
              dotColor: Colors.green,
              dotRadius: 5.0,
              density: 150,
            ),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 100),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/staff.png', height: 50),
                ),
                const SizedBox(height: 8),
                Image.asset('assets/agrieuropa.png', height: 50),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(40),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withAlpha(150)),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Bienvenido",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 40),
                            _buildUsernameField(),
                            const SizedBox(height: 20),
                            _buildPasswordField(),
                            const SizedBox(height: 20),
                            _buildRoleDropdown(),
                            const SizedBox(height: 30),
                            _buildLoginButton(),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "¿Olvidaste tu contraseña?",
                                style: TextStyle(
                                  color: Colors.white70,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _usernameController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Usuario",
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.person, color: Colors.white70),
      ),
      validator:
          (value) =>
              (value == null || value.isEmpty)
                  ? 'Por favor, ingrese su usuario'
                  : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: _passwordController,
      obscureText: _obscurePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Contraseña",
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.lock, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator:
          (value) =>
              (value == null || value.isEmpty)
                  ? 'Por favor, ingrese su contraseña'
                  : null,
    );
  }

  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: _role,
      dropdownColor: Colors.black.withOpacity(0.7),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.group, color: Colors.white70),
      ),
      items: const [
        DropdownMenuItem(value: "empleado", child: Text("Empleado")),
        DropdownMenuItem(value: "admin", child: Text("Administrador")),
      ],
      onChanged: (value) => setState(() => _role = value!),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.green.shade700],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton.icon(
        onPressed: _login,
        label: const Text(
          "Ingresar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
