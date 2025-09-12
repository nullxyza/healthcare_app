import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class UploadReportsScreen extends StatefulWidget {
  @override
  _UploadReportsScreenState createState() => _UploadReportsScreenState();
}

class _UploadReportsScreenState extends State<UploadReportsScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    // Request permission to access gallery or camera
    var status = await (source == ImageSource.gallery
        ? Permission.photos.request()
        : Permission.camera.request());
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('Permission denied.');
    }
  }

  void _submitReport() {
    if (_image != null) {
      // Submit the image or report
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Report submitted successfully!')),
      );
      Navigator.pop(context, true); // Return true indicating success
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Reports'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Click to Upload Radiology Image here!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                onTap: () => getImage(ImageSource.gallery),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: _image == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate,
                                  size: 100, color: Colors.grey),
                              SizedBox(height: 10),
                              Text(
                                'Tap to select an image from gallery',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(_image!,
                                fit: BoxFit.cover, width: double.infinity),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () => getImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
                label: const Text('Select Image from Gallery'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 17, 17, 17),
                  backgroundColor: Color.fromARGB(255, 224, 224, 224),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () => getImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 17, 17, 17),
                  backgroundColor: Color.fromARGB(255, 227, 228, 228),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: _submitReport,
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
