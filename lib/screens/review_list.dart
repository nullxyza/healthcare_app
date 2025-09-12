import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildHeaderText(),
          SizedBox(height: 16.0),
          _buildReviewCard(
            icon: Icons.local_hospital,
            heading: 'Ajay',
            subheading: 'Incomplete',
          ),
          SizedBox(height: 16.0),
          _buildReviewCard(
            icon: Icons.local_hospital,
            heading: 'Rahul',
            subheading: 'Completed',
          ),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      'Review List',
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildReviewCard({
    required IconData icon,
    required String heading,
    required String subheading,
  }) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(199, 24, 163, 119),
              Color.fromARGB(181, 35, 85, 49),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 60.0,
              color: Colors.white,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    subheading,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
