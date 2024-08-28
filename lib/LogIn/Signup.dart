import 'package:flutter/material.dart';
import 'package:adel2/home/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LogIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController yournamecontroller2 = TextEditingController();
  TextEditingController usernamecontroller2 = TextEditingController();
  TextEditingController passwordcontroller2 = TextEditingController();
  bool _isPasswordVisible = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  void _initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save the username and password using SharedPreferences
  void _saveCredentials(String name, String username, String password) async {
    await _prefs.setString('name', name);
    await _prefs.setString('username', username);
    await _prefs.setString('password', password);
  }

  void _navigatetoprev() {
    Navigator.pop(context);
  }

  void _NavigateToLogiN() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  void _NavigateToHomepage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
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
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: _navigatetoprev,
            elevation: 0.5,
          ),
        ),
        body: SingleChildScrollView(child: _page2()),
      ),
    );
  }

  Widget _page2() {
    return Padding(
      padding: const EdgeInsets.only(top: 90, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _WlcTxt2(),
          const SizedBox(height: 30),
          _NewUerName(),
          const SizedBox(height: 8),
          _inputField2('Enter your Name', yournamecontroller2),
          const SizedBox(height: 30),
          _emailText2(),
          const SizedBox(height: 8),
          _inputField2('example@gmail.com', usernamecontroller2),
          const SizedBox(height: 30),
          _passText2(),
          const SizedBox(height: 8),
          _inputField2('***********', passwordcontroller2, isPassword: true),
          const SizedBox(height: 30),
          _signupBtn(),
          const SizedBox(height: 30),
          _GoogleSignIn2(),
          const SizedBox(height: 80),
          _extraText2(),
        ],
      ),
    );
  }

  Widget _NewUerName() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Your Name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailText2() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Email Address',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _passText2() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Password',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _WlcTxt2() {
    return const Column(
      children: [
        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: 'AIRBNB',
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Text(
          "Let's Create Account Together",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'AIRBNB',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _inputField2(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _signupBtn() {
    return ElevatedButton(
      onPressed: () {
        String name = yournamecontroller2.text;
        String username = usernamecontroller2.text;
        String password = passwordcontroller2.text;

        // Save the credentials including the new username
        _saveCredentials(name, username, password);

        // Navigate to home page
        _NavigateToHomepage();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          'Sign up',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _GoogleSignIn2() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/Google_Logo.png",
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            const Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _extraText2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have An Account?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        TextButton(
          onPressed: _NavigateToLogiN,
          child: const Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
