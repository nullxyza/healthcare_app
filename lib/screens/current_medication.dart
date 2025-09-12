import 'package:flutter/material.dart';

class CurrentMedication {
  final String name;
  final String dosage;
  final String frequency;

  CurrentMedication({
    required this.name,
    required this.dosage,
    required this.frequency,
  });
}

class CurrentMedicationPage extends StatefulWidget {
  @override
  _CurrentMedicationPageState createState() => _CurrentMedicationPageState();
}

class _CurrentMedicationPageState extends State<CurrentMedicationPage> {
  final List<CurrentMedication> _currentMedications = [
    CurrentMedication(name: 'Aspirin', dosage: '325mg', frequency: 'Daily'),
    CurrentMedication(
      name: 'Ibuprofen',
      dosage: '200mg',
      frequency: 'As needed',
    ),
    CurrentMedication(name: 'Atorvastatin', dosage: '10mg', frequency: 'Daily'),
  ]; // Sample data for current medications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Medication'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to left
          children: [
            // Heading text
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0), // Add some space below
              child: Text(
                'Your Current Medications',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            // Center the table horizontally
            Center(
              child: _currentMedications.isNotEmpty
                  ? DataTable(
                      headingRowColor:
                          MaterialStateProperty.all(Colors.grey[200]),
                      columnSpacing: 16.0, // Add spacing between columns
                      dataRowHeight: 60.0, // Increase row height
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey), // Add table border
                      ),
                      columns: [
                        const DataColumn(
                          label: Text('Medication',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const DataColumn(
                          label: Text('Dosage',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const DataColumn(
                          label: Text('Frequency',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      rows: _currentMedications
                          .map((medication) =>
                              _currentMedicationDataRow(medication))
                          .toList(),
                    )
                  : const Text('No current medications listed.'),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _currentMedicationDataRow(CurrentMedication medication) {
    return DataRow(
      cells: [
        DataCell(Text(medication.name)),
        DataCell(Text(medication.dosage)),
        DataCell(Text(medication.frequency)),
      ],
    );
  }
}
