import 'package:flutter/material.dart';
import 'package:adel2/home/Home.dart';
import 'recovery_password.dart';
import 'Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _isPasswordVisible = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  // Initialize SharedPreferences
  void _initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _navigatetoprev() {
    Navigator.pop(context);
  }

  void _navigatetoforward() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecoveryPassword()),
    );
  }

  void _NavigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  // Handle login by checking saved credentials
  void _login() async {
    final String username = usernamecontroller.text;
    final String password = passwordcontroller.text;

    // Retrieve saved username and password from SharedPreferences
    String? savedUsername = _prefs.getString('username');
    String? savedPassword = _prefs.getString('password');

    // Check if entered credentials match saved credentials
    if (savedUsername == username && savedPassword == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      _showErrorDialog('Invalid username or password');
    }
  }

  // Display error dialog if login fails
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFFF8E1)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: 40,
            height: 40,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              onPressed: _navigatetoprev,
              elevation: 0.5,
            ),
          ),
        ),
        body: SingleChildScrollView(child: _page()),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.only(top: 90, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          _WlcTxt(),
          const SizedBox(height: 20),
          _emailText(),
          const SizedBox(height: 8),
          _inputField('Username', usernamecontroller),
          const SizedBox(height: 30),
          _passText(),
          const SizedBox(height: 8),
          _inputField('Password', passwordcontroller, isPassword: true),
          const SizedBox(height: 2),
          _recpass(),
          const SizedBox(height: 2),
          _loginBtn(),
          const SizedBox(height: 30),
          _GoogleSignIn(),
          const SizedBox(height: 180),
          _extraText(),
        ],
      ),
    );
  }

  Widget _emailText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Email Address',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _passText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Password',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _recpass() {
    return TextButton(
      onPressed: _navigatetoforward,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Recovery Password',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'AIRBNB',
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _WlcTxt() {
    return const Column(
      children: [
        Text(
          'Hello Again!',
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
          'Welcome Back You’ve Been Missed!',
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

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
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
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _GoogleSignIn() {
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

  Widget _extraText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an Account?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        TextButton(
          onPressed: _NavigateToSignUp,
          child: const Text(
            "Sign Up For Free",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
