import 'package:flutter/material.dart';
import 'model_dades.dart';

class PantallaResum extends StatefulWidget {
  final InscripcioDades dades;

  const PantallaResum({super.key, required this.dades});

  @override
  State<PantallaResum> createState() => _PantallaResumState();
}

class _PantallaResumState extends State<PantallaResum> {
  @override
  Widget build(BuildContext context) {
    // Funció per convertir la llista d'interessos en un String llegible
    String interessosStr = widget.dades.interessos.isEmpty
        ? 'Cap interès seleccionat'
        : widget.dades.interessos.join(', ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resum de Dades'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Títol
            const Text(
              'Dades del Participant:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // Nom
            _buildDataRow('Nom:', widget.dades.nom),

            // Gènere
            _buildDataRow('Gènere:', widget.dades.genere),

            // Interessos
            _buildDataRow('Interessos:', interessosStr),

            const SizedBox(height: 40),

            // Botó Tornar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Retornar a la pantalla principal amb Navigator.pop
                  Navigator.pop(context);
                },
                child: const Text('Tornar al Formulari'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar per formatar les files de dades
  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}