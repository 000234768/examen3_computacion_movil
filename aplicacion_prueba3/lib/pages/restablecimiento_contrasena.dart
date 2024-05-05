import 'package:flutter/material.dart';
import '../widgets/login_header.dart';

class RestableceContrasena extends StatelessWidget {
  RestableceContrasena({super.key});
  
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword(BuildContext context) async {
    final String email = _emailController.text;

    // Simular envío de correo de restablecimiento de contraseña
    await Future.delayed(Duration(seconds: 2));

    // Mostrar un cuadro de diálogo para indicar que se envió el correo de restablecimiento de contraseña
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Correo enviado'),
          content: Text('Se ha enviado un correo electrónico para restablecer la contraseña.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const MyLoginHeader(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Ingrese su Correo para restablecer su contraseña'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => _showResetPasswordDialog(context),
              child: Text('Restablecer contraseña'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResetPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Correo enviado'),
          content: Text('Se ha enviado un correo electrónico para restablecer la contraseña.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

