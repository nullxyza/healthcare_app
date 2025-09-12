import 'package:flutter/material.dart';

class NewReviewScreen extends StatefulWidget {
  @override
  _NewReviewScreenState createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
  List<bool> successStates = [
    false,
    false,
    false,
    false,
    false,
    false
  ]; // List to track success state for each card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 10),
          const Text(
            'Fill the Details Below!',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          buildReviewCard(
            context,
            title: 'Patient Information',
            subtitle: 'Details about the patient',
            icon: Icons.person,
            success: successStates[0], // Get success state for card at index 0
            routeName: '/patientInfo',
            onTap: () {
              _handleCardTapped(
                  '/patientInfo'); // Handle card tap for card at index 0
            },
          ),
          buildReviewCard(
            context,
            title: 'Medical Details',
            subtitle: 'Fill required Medical details',
            icon: Icons.medical_services,
            success: successStates[1], // Get success state for card at index 1
            routeName: '/doctorDetails',
            onTap: () {
              _handleCardTapped(
                  '/doctorDetails'); // Handle card tap for card at index 1
            },
          ),
          buildReviewCard(
            context,
            title: 'Upload Reports',
            subtitle: 'Upload necessary reports',
            icon: Icons.upload_file,
            success: successStates[2], // Get success state for card at index 2
            routeName: '/uploadReports',
            onTap: () {
              _handleCardTapped(
                  '/uploadReports'); // Handle card tap for card at index 2
            },
          ),
          buildMedicalCard(
            context,
            title: 'Medical Records(optional)',
            subtitle: 'Add Previous Medical Reports here',
            icon: Icons.insert_drive_file,
            routeName: '/medicalRecords',
            onTap: () {
              _handleMedCardTapped('/medicalRecords');
            },
          ),
          buildMedicalCard(
            context,
            title: 'Current Medications',
            subtitle: 'Review Current Medications here',
            icon: Icons.insert_drive_file,
            routeName: '/currentMedication',
            onTap: () {
              _handleMedCardTapped('/currentMedication');
            },
          ),
          buildMedicalCard(
            context,
            title: 'Payments',
            subtitle: 'Complete payment process',
            icon: Icons.payment,
            routeName: '/payments',
            onTap: () {
              _handleMedCardTapped('/payments');
            },
          ),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget buildReviewCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool success,
    required String routeName,
    required VoidCallback onTap, // Add onTap parameter
  }) {
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: success
            ? Icon(Icons.check_circle, color: Color.fromARGB(255, 12, 184, 58))
            : Icon(Icons.error, color: Colors.red),
        onTap: onTap, // Call onTap callback when tapped
      ),
    );
  }

  void _handleCardTapped(String routeName) {
    Navigator.pushNamed(context, routeName).then((value) {
      if (value != null) {
        int index = _getIndexOfRoute(routeName);
        if (index != -1) {
          setState(() {
            successStates[index] =
                true; // Update success state for card at specified index
          });
        }
      }
    });
  }

  int _getIndexOfRoute(String routeName) {
    switch (routeName) {
      case '/patientInfo':
        return 0;
      case '/doctorDetails':
        return 1;
      case '/uploadReports':
        return 2;
      default:
        return -1;
    }
  }

  Widget buildMedicalCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String routeName,
    required VoidCallback onTap, // Add onTap parameter
  }) {
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap, // Call onTap callback when tapped
      ),
    );
  }

  void _handleMedCardTapped(String routeName) {
    Navigator.pushNamed(context, routeName).then((value) {
      if (value != null) {
        int index = _getMedIndexOfRoute(routeName);
        if (index != -1) {
          setState(() {
            successStates[index] =
                true; // Update success state for card at specified index
          });
        }
      }
    });
  }

  int _getMedIndexOfRoute(String routeName) {
    switch (routeName) {
      case '/medicalRecords':
        return 3;
      case '/currentMedication':
        return 4;
      case '/payments':
        return 5;
      default:
        return -1;
    }
  }
}
