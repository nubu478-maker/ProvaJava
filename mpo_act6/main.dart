import 'package:flutter/material.dart';
import 'model_dades.dart';
import 'resum_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pt6_Busquets_Nuria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaFormulari(),
    );
  }
}


class PantallaFormulari extends StatefulWidget {
  const PantallaFormulari({super.key});

  @override
  State<PantallaFormulari> createState() => _PantallaFormulariState();
}

class _PantallaFormulariState extends State<PantallaFormulari> {
  // Controladors i Estat
  final TextEditingController _nomController = TextEditingController();
  
  // RadioButtons (Gènere)
  String? _genereSeleccionat = 'Home';
  final List<String> _opcionsGenere = ['Home', 'Dona', 'Altres'];
  
  // Checkboxes (Interessos)
  final Map<String, bool> _interessos = {
    'Esport': false,
    'Tecnologia': false,
    'Música': false,
    'Lectura': false,
  };

  // Funció per generar la llista d'interessos seleccionats per passar a la segona pantalla
  List<String> _getInteressosSeleccionats() {
    List<String> seleccionats = [];
    _interessos.forEach((key, value) {
      if (value) {
        seleccionats.add(key);
      }
    });
    return seleccionats;
  }

  // Funció de Navegació
  void _enviarDades() {
    if (_nomController.text.isEmpty || _genereSeleccionat == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Si us plau, omple el camp Nom i selecciona un Gènere.')));
        return;
    }

    // 1. Crear l'objecte de dades
    final dades = InscripcioDades(
      nom: _nomController.text,
      genere: _genereSeleccionat!,
      interessos: _getInteressosSeleccionats(),
    );

    // 2. Navegar a la segona pantalla
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PantallaResum(dades: dades),
      ),
    ).then((_) {

        print('Tornat a la Pantalla Formulari');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulari d\'Inscripció'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            const Text('Nom del Participant:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                hintText: 'Introdueix el teu nom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Gènere:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ..._opcionsGenere.map((String opcio) {
              return ListTile(
                title: Text(opcio),
                leading: Radio<String>(
                  value: opcio,
                  groupValue: _genereSeleccionat,
                  onChanged: (String? valor) {
                    setState(() {
                      _genereSeleccionat = valor;
                    });
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 20),


            const Text('Interessos:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ..._interessos.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: _interessos[key],
                onChanged: (bool? valor) {
                  setState(() {
                    _interessos[key] = valor!;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: _enviarDades,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Enviar Informació'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}