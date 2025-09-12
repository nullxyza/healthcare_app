import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for user information
  final Map<String, TextEditingController> _controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'zip': TextEditingController(),
  };

  // Selected country and list of countries
  String? selectedCountry;
  final List<String> countries = [
    'United States',
    'Canada',
    'Mexico',
    'India',
    'United Kingdom'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Information',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                buildNameFields(),
                const SizedBox(height: 20),
                buildCountryDropdown(),
                const SizedBox(height: 20),
                buildPhoneField(),
                const SizedBox(height: 20),
                buildAddressFields(),
                const SizedBox(height: 20),
                buildUpdateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controllers['firstName'],
            decoration: const InputDecoration(labelText: 'First Name'),
            validator: (value) => validateField(value, 'First Name'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: _controllers['lastName'],
            decoration: const InputDecoration(labelText: 'Last Name'),
            validator: (value) => validateField(value, 'Last Name'),
          ),
        ),
      ],
    );
  }

  Widget buildCountryDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      hint: const Text('Select Country'),
      onChanged: (String? newValue) =>
          setState(() => selectedCountry = newValue),
      items: countries
          .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      validator: (value) => value == null ? 'Please select your country' : null,
    );
  }

  Widget buildPhoneField() {
    return TextFormField(
      controller: _controllers['phone'],
      decoration: const InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.phone,
      validator: (value) => validateField(value, 'Phone Number'),
    );
  }

  Widget buildAddressFields() {
    return Column(
      children: [
        TextFormField(
          controller: _controllers['address'],
          decoration: const InputDecoration(labelText: 'Address'),
          validator: (value) => validateField(value, 'Address'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controllers['city'],
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) => validateField(value, 'City'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: _controllers['state'],
                decoration: const InputDecoration(labelText: 'State'),
                validator: (value) => validateField(value, 'State'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controllers['zip'],
          decoration: const InputDecoration(labelText: 'Zip Code'),
          keyboardType: TextInputType.number,
          validator: (value) => validateField(value, 'Zip Code'),
        ),
      ],
    );
  }

  Widget buildUpdateButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Handle form submission logic here (e.g., update user profile)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile updated successfully!'),
              ),
            );
          }
        },
        child: const Text(
          'Update Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }
}
