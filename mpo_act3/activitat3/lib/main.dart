import 'package:flutter/material.dart';

class MyTextFieldPage extends StatefulWidget {
  const MyTextFieldPage({super.key});

  @override
  State<MyTextFieldPage> createState() => _MyTextFieldPageState();
}

class _MyTextFieldPageState extends State<MyTextFieldPage> {
  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField amb controlador")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller1,
              decoration: const InputDecoration(
                labelText: "Nom",
                hintText: "Escriu el teu nom",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Nom: ${controller1.text}");
              },
              child: const Text("Mostrar nom per consola"),
            ),
          ],
        ),
      ),
    );
  }
}
