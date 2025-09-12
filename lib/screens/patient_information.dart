import 'package:flutter/material.dart';

class PatientInformation {
  final String name;
  final int age;
  final String sex;
  final double weight;
  final double height;
  final String bloodPressure;

  PatientInformation({
    required this.name,
    required this.age,
    required this.sex,
    required this.weight,
    required this.height,
    required this.bloodPressure,
  });
}

class PatientInformationScreen extends StatefulWidget {
  @override
  _PatientInformationScreenState createState() =>
      _PatientInformationScreenState();
}

class _PatientInformationScreenState extends State<PatientInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController bpController = TextEditingController();

  String? selectedSex;
  final List<String> sexes = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter Details Below!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedSex,
              hint: const Text('Select Sex'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSex = newValue;
                });
              },
              items: sexes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: bpController,
              decoration: const InputDecoration(
                labelText: 'Blood Pressure',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate and submit patient information
                if (_validateForm()) {
                  _submitForm();
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    // Check if all fields have text
    return nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedSex != null &&
        weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        bpController.text.isNotEmpty;
  }

  void _submitForm() {
    // Submit patient information
    // You can access the entered data using the controllers
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0; // Default value 0
    final String sex = selectedSex ?? ''; // Default value empty string
    final double weight =
        double.tryParse(weightController.text) ?? 0.0; // Default value 0.0
    final double height =
        double.tryParse(heightController.text) ?? 0.0; // Default value 0.0
    final String bp = bpController.text;

    // Create an instance of PatientInformation
    final patientInfo = PatientInformation(
      name: name,
      age: age,
      sex: sex,
      weight: weight,
      height: height,
      bloodPressure: bp,
    );

    // Pass the patient information back to the previous screen
    Navigator.pop(context, patientInfo);
  }
}
