import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/change_password.dart';
import 'package:healthcare_app/screens/current_medication.dart';
import 'package:healthcare_app/screens/doctor_details_screen.dart';
import 'package:healthcare_app/screens/home_screen.dart';
import 'package:healthcare_app/screens/login_sreen.dart';
import 'package:healthcare_app/screens/medical_records.dart';
import 'package:healthcare_app/screens/patient_information.dart';
import 'package:healthcare_app/screens/payments.dart';
import 'package:healthcare_app/screens/signup_screen.dart';
import 'package:healthcare_app/screens/upload_report_screen.dart';

void main() {
  runApp(HealthCareApp());
}

class HealthCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Second Opinion',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 44, 119, 73),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/patientInfo': (context) => PatientInformationScreen(),
        '/doctorDetails': (context) => DoctorDetailsScreen(),
        '/uploadReports': (context) => UploadReportsScreen(),
        '/signupPage': (context) => SignupScreen(),
        '/changePassword': (context) => ChangePasswordScreen(),
        '/medicalRecords': (context) => MedicalRecordsPage(),
        '/currentMedication': (context) => CurrentMedicationPage(),
        '/payments': (context) => PaymentPage(),
      },
    );
  }
}
