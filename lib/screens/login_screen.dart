import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/api_service.dart';
import 'camera_stream_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Centraliza toda a coluna
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Apenas o espaço necessário
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Apenas números
                  LengthLimitingTextInputFormatter(3),    // Máximo de 3 caracteres
                ],
                decoration: const InputDecoration(
                  labelText: 'Digite a senha (3 dígitos)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool isValid = await ApiService.validateCode(_controller.text);
                  if (isValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CameraStreamScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Código inválido')),
                    );
                  }
                },
                child: const Text('Validar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
