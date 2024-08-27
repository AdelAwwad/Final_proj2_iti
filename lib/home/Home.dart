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
  List<bool> isPressed = [false, true];

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
        SizedBox(
          height: 20,
        ),
        _Poptxt(),
        SizedBox(
          height: 20,
        ),
        _Bstsell(),
        SizedBox(
          height: 40,
        ),
        _Arvltxt(),
        SizedBox(
          height: 20,
        ),
        _End(),
        SizedBox(
          height: 40,
        ),
        _Footer(),


      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(top: 60, right: 10),
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
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 24,
                ),
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
  }

  Widget _Poptxt() {
    return const Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            "Popular Shoes",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "AIRBNB"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 220),
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: 13, color: Colors.cyan, fontFamily: "AIRBNB"),
            ),
          )
        ],
      ),
    );
  }

  Widget _Bstsell() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/image/Nike4.png"),
                  width: 200,
                  height: 140,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "BEST SELLER",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.cyan,
                          fontFamily: "AIRBNB"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nike Jordan",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "AIRBNB"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "\$ 493.00",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "AIRBNB"),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/image/Nike5.jpg"),
                  width: 200,
                  height: 140,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "BEST SELLER",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.cyan,
                          fontFamily: "AIRBNB"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nike Air Max",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "AIRBNB"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "\$ 897.99",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "AIRBNB"),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _Arvltxt() {
    return const Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            "New Arrivals",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "AIRBNB"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 220),
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: 13, color: Colors.cyan, fontFamily: "AIRBNB"),
            ),
          )
        ],
      ),
    );
  }

  Widget _End() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 140,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Stack(children: [
                  Positioned.fill(
                    top: 20,
                       left: 120,
                      child: Image.asset(
                        'assets/image/Nike6_Shadow.png',
                        width: 2,
                        height: 2,
                        fit: BoxFit.cover,
                      )),

                  Positioned(
                      left: 160,
                      top: 20,
                      child: Image.asset(
                        'assets/image/Nike6.png',
                        width: 185,
                        height: 110,

                        fit: BoxFit.contain,
                      )),
                  const Positioned(
                    top: 20,
                    left: 15,
                    child: Text(
                      "BEST CHOICE",
                      style: TextStyle(
                           color: Colors.cyan ,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          fontFamily: "AIRBNB"),
                    ),
                  ),

                  const Positioned(
                        top: 50,
                        left: 15,
                      child: Text(
                        "New Air Jordan",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB"),
                      ),
                      ),
                  const Positioned(
                    top: 100,
                    left: 15,
                    child: Text(
                      "\$849.69",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "AIRBNB"),
                    ),
                  )

                ])
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _Footer() {
    return Row(
      children: [
        Container(
          width: 411,
          height: 70,
          color: Colors.grey,
        ),
        Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              fit:  StackFit.expand,
            children: [



            ],




            ))
      ],


    );
  }









}

