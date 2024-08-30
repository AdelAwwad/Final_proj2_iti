import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _name;
  late String _username;
  late String _password;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
   
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _name = prefs.getString('name') ?? 'No name';
        _username = prefs.getString('username') ?? 'No email';
        _password = prefs.getString('password') ?? 'No password';
        // Load the image path from SharedPreferences if saved
        String? imagePath = prefs.getString('profile_image_path');
        if (imagePath != null) {
          _imageFile = File(imagePath);
        }
      });
    } catch (e) {
      // Handle errors during loading profile data
      print("Error loading profile data: $e");
    }
  }

  void _navigatetoprev() {
    Navigator.pop(context);
  }


  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        final imageFile = File(image.path);
        final savedImage = await imageFile.copy(imagePath);

        setState(() {
          _imageFile = savedImage;
        });

        // Save the image path in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('profile_image_path', savedImage.path);

        // Show success notification
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo successfully uploaded!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle case where user didn't pick an image
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle errors during image picking or saving
      print("Error picking or saving image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking or saving image.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            onPressed: _navigatetoprev,
            elevation: 0.5,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(child: _pageContent()),
      ),
    );
  }

  Widget _pageContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _edit(),
          const SizedBox(height: 20),
          _img(),
          const SizedBox(height: 20),
          _fulnam(),
          const SizedBox(height: 10),
          _prflData( _name),
          const SizedBox(height: 20),
          _email(),
          const SizedBox(height: 10),
          _prflData( _username),
          const SizedBox(height: 20),
          _pass(),
          const SizedBox(height: 10),
          _prflData( _password, isPassword: true),
        ],
      ),
    );
  }

  Widget _edit() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'AIRBNB',
                color: Colors.black,
              ),
            ),
          ),
        ),
        Icon(
          Icons.mode_edit_outline_rounded,
          color: Colors.cyan,
          size: 30,
        ),
      ],
    );
  }

  Widget _img() {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            child: _imageFile == null
                ? const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 40,
            )
                : null,
          ),
        ),
        Text(_name, style: const TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "AIRBNB"),)
      ],
    );
  }

  Widget _fulnam() {
    return Container(
      child:  const Align(
        alignment: Alignment.topLeft,
        child: Text("Full Name" ,style:  TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "AIRBNB"), ),
      ),
    );
  }

  Widget _email() {
    return Container(
      child:  const Align(
        alignment: Alignment.topLeft,
        child: Text("Email Address" ,style:  TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "AIRBNB"), ),
      ),
    );
  }


  Widget _pass() {
    return Container(
      child:  const Align(
        alignment: Alignment.topLeft,
        child: Text("Password" ,style:  TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: "AIRBNB"), ),
      ),
    );
  }



  Widget _prflData(String value, {bool isPassword = false}) {
    return TextField(
      controller: TextEditingController(text: value),
      readOnly: true,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
