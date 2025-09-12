import 'package:flutter/material.dart';

class MedicalRecordsPage extends StatefulWidget {
  @override
  _MedicalRecordsPageState createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {
  final List<Medication> _medications = [];
  final TextEditingController _medicationNameController =
      TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Records'),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView for scrollable content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to left
          children: [
            // Medication details section with borders
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      "Enter Medical Information Below!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                                labelText: 'Medication Name'),
                            controller: _medicationNameController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: 'Dosage'),
                            controller: _dosageController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: 'Frequency'),
                            controller: _frequencyController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _medications.add(Medication(
                            name: _medicationNameController.text,
                            dosage: _dosageController.text,
                            frequency: _frequencyController.text,
                          ));
                          _medicationNameController.text = '';
                          _dosageController.text = '';
                          _frequencyController.text = '';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                      child: const Text(
                        'Add Medication',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Past medications table with styling
            _medications.isNotEmpty
                ? DataTable(
                    headingRowColor:
                        MaterialStateProperty.all(Colors.grey[200]),
                    columnSpacing: 16.0, // Add spacing between columns
                    dataRowHeight: 60.0, // Increase row height
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey), // Add table border
                    ),
                    columns: const [
                      DataColumn(
                          label: Text('Medication',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Dosage',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Frequency',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: _medications
                        .map((medication) => _medicationDataRow(medication))
                        .toList(),
                  )
                : const Text('No past medications added.'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  DataRow _medicationDataRow(Medication medication) {
    return DataRow(
      cells: [
        DataCell(Text(medication.name)),
        DataCell(Text(medication.dosage)),
        DataCell(Text(medication.frequency)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete,
                color: Colors.red), // Set delete icon color
            onPressed: () {
              setState(() {
                _medications.remove(medication);
              });
            },
          ),
        ),
      ],
    );
  }
}

class Medication {
  final String name;
  final String dosage;
  final String frequency;

  Medication(
      {required this.name, required this.dosage, required this.frequency});
}
