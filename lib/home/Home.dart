import 'package:flutter/material.dart';

// import 'package:location/location.dart' as loc; // Alias 'loc' used here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  loc.LocationData? _currentPosition; // Use the alias 'loc'
  //  String? _currentAddress = "Ismailia,Egypt";
  // // Use the alias 'loc'
  List<bool> isPressed = [false,true];
  @override
  void initState() {
    super.initState();
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
          child: Container(
            width: 40,
            height: 40,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/image/four-circle2 (2).png"),
                  // Correctly loading the image
                  width: 24,
                  // Adjust the size if needed
                  height: 24,
                ),
              ),
              onPressed: () {},
              elevation: 0.5,
            ),
          ),
        ),
        body: SingleChildScrollView(child: _page2()),
      ),
    );
  }

  Widget _page2() {
    return Column(
      children: [
        _header(),
        SizedBox(
          height: 30,
        ),
        _srch(),
        SizedBox(
          height: 30,
        ),
        _slct(),
      ],
    );
  }
  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(top: 60 ,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store Location',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    // _currentAddress
                    "Ismailia,Egypt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          Container(
            width: 45,
            height: 45,
            child: FloatingActionButton(

              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              child: const Center(
                child: Icon(Icons.shopping_bag_outlined, size: 24, ),
              ),
              onPressed: () {},
              elevation: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _srch() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        style: TextStyle(color: Colors.black),
        // controller: ,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Looking for shoes',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.green))),
      ),
    );
  }
  Widget _slct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              child: const Center(
                child: Image(image: AssetImage("assets/image/Nike-Logo.png")),
              ),
              onPressed: () {
                setState(() {
                  isPressed[0] = !isPressed[0];
                });
              },
              backgroundColor: isPressed[0] ? Colors.blue : Colors.white,
              elevation: 0.5,
            ),
          ),
        ),
      ],
    );
  }}
