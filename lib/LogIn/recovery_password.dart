import 'package:flutter/material.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  TextEditingController emailaddresscontroller = TextEditingController();

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFFF8E1)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Container(
            width: 40,
            height: 40,
            child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                )),
                onPressed: _navigateBack,
                elevation: 0.5),
          ),
        ),
        body: SingleChildScrollView(child: _RecPage()),
      ),
    );
  }


Widget _RecPage() {
  return Padding(
    padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        _Wtext(),
        const SizedBox(
          height: 30,
        ),
        _txt(),
        const SizedBox(
          height: 10,
        ),
        _InputText('Enter your email', emailaddresscontroller),
        const SizedBox(
          height: 30,
        ),
        _RecBtn()
      ],
    ),
  );
}

Widget _Wtext() {
  return const Column(
    children: [
      Text(
        'Recovery Password',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'AIRBNB',
          color: Colors.black,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 4),
        child: Text(
          'Please Enter your Email Address To Recieve a Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'AIRBNB',
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}

Widget _txt() {
  return const Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Email Address',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _InputText(String hintText, TextEditingController controller) {
  return TextField(
    style: TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(18))),
  );
}
Widget _RecBtn() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(vertical: 14),
    ),
    child: const SizedBox(
      width: double.infinity,
      child: Text(
        'Continue',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
}