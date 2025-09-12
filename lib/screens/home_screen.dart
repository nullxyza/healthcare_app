import 'package:flutter/material.dart';
import 'package:healthcare_app/Custom/CustomBottomNavigationBar.dart';
import 'package:healthcare_app/screens/new_review_screen.dart';
import 'package:healthcare_app/screens/profile_screen.dart';
import 'package:healthcare_app/screens/review_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ReviewList(),
    NewReviewScreen(),
    ProfileScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hi! User",
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
              // Handle menu item selection
              switch (value) {
                case 'profile':
                  // Navigate to profile screen
                  break;
                case 'changePassword':
                  Navigator.pushNamed(context, '/changePassword');
                  break;
                case 'signOut':
                  Navigator.pop(context);
                  // Perform sign out operation
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'changePassword',
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'signOut',
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Sign Out'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle navigation item taps
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
