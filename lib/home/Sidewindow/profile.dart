import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 late String _name ;
 late String _username ;
 late   String _password ;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

   Future <void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'No name';
      _username = prefs.getString('username') ?? 'No email';
      _password = prefs.getString('password') ?? 'No password';
    });
  }

  void _navigatetoprev() {
    Navigator.pop(context);
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
              Icons.arrow_back_ios,
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
          const SizedBox(height: 150),
          _img(),
          const SizedBox(height: 30),
          _prflData('Full Name', _name),
          const SizedBox(height: 30),
          _prflData('Email Address', _username),
          const SizedBox(height: 30),
          _prflData('Password', _password, isPassword: true),
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
    return Container(); // Placeholder for image widget
  }

  Widget _prflData(String label, String value, {bool isPassword = false}) {
    return TextField(
      controller: TextEditingController(text: value),
      readOnly: true,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),

        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
