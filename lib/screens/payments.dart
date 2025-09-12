import 'package:flutter/material.dart';

class Payment {
  final DateTime date;
  final String medicineName;
  final String dosage;
  final double amount;

  Payment({
    required this.date,
    required this.medicineName,
    required this.dosage,
    required this.amount,
  });
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<Payment> _payments = [
    Payment(
      date: DateTime(2024, 6, 1),
      medicineName: 'Aspirin',
      dosage: '325mg',
      amount: 10.50,
    ),
    Payment(
      date: DateTime(2024, 5, 25),
      medicineName: 'Ibuprofen',
      dosage: '200mg',
      amount: 15.75,
    ),
  ]; // Sample data for payments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to left
          children: [
            const Text(
              'Your Payment History',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Center the table horizontally
            Center(
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                columnSpacing: 16.0, // Add spacing between columns
                dataRowHeight: 60.0, // Increase row height
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Add table border
                ),
                columns: const [
                  DataColumn(
                    label: Text(
                      'First Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Column(
                      children: [
                        Text(
                          'Medicine',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(Dosage)',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: _payments
                    .map((payment) => _paymentDataRow(payment))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _paymentDataRow(Payment payment) {
    return DataRow(
      cells: [
        DataCell(Text(payment.date
            .toString()
            .substring(0, 10))), // Extract date only (first date)
        DataCell(
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: payment.medicineName),
                const TextSpan(
                  text: ' (',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                TextSpan(
                  text: payment.dosage,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                const TextSpan(
                  text: ')',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        DataCell(Text(payment.amount.toStringAsFixed(2) +
            " Rs")), // Format amount with 2 decimal places
      ],
    );
  }
}
