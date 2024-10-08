import 'package:adel2/home/Men%20shoes/Men_shoes.dart';
import 'package:adel2/home/Sidewindow/Favorite.dart';
import 'package:adel2/home/Sidewindow/Notification.dart';
import 'package:adel2/home/Sidewindow/SideWindow.dart';
import 'package:adel2/home/Sidewindow/mycart.dart';
import 'package:adel2/home/repository/Repository.dart';
import 'package:flutter/material.dart';

// import 'package:location/location.dart' as loc; // Alias 'loc' used here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isPressed = List.generate(5, (index) => index == 0);

  double xoffset = 0;
  double yoffset = 0;
  bool isDrawerOpen = false;
  final ScrollController _scrollController = ScrollController();
  late List<ShoesData> ShoesDataModelList;

  @override
  void initState() {
    super.initState();
    repodata();
    _scrollController.addListener(() {
      print('Scroll position: ${_scrollController.position.pixels}');
    });
  }

  @override
  void dispose() {
    // Dispose the controller when done
    _scrollController.dispose();
    super.dispose();
  }

  void repodata() {
    ShoesDataModelList = [
      ShoesData("assets/image/Nike4.png", "Nike Jordan", 493.00),
      ShoesData("assets/image/Nike5+.png", "Nike Air Max", 897.99),
      ShoesData('assets/image/Nike6.png', "Nike Air Jordan", 849.69),
    ];
  }


  void _toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        xoffset = 0;
        yoffset = 0;
        isDrawerOpen = false;
      } else {
        xoffset = 280; // Values adjusted for drawer effect
        yoffset = 80;
        isDrawerOpen = true;
      }
    });
  }

  void _navigateToSideWindow() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Sidewindow()),
    );
  }
  void _navigateToMenShoes(ShoesData selectedShoe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenShoes(selectedShoe: selectedShoe)),
    );
  }
  void _navigateToFavoritePage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
  }

  void _navigateToNotifaication(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Sidewindow(),
        AnimatedContainer(
          transform: Matrix4.translationValues(xoffset, yoffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -0.05 : 0),
          duration: const Duration(milliseconds: 200),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(child: _page2()),
          ),
        ),
      ],
    );
  }

  Widget _page2() {
    return Column(
      children: [
        _header(),
        const SizedBox(height: 30),
        _srch(),
        const SizedBox(height: 30),
        _slct(),
        const SizedBox(height: 20),
        _Poptxt(),
        const SizedBox(height: 20),
        _Bstsell(),
        const SizedBox(height: 40),
        _Arvltxt(),
        const SizedBox(height: 20),
        _End(),
        const SizedBox(height: 40),
        _Footer(),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 10),
      child: Row(
        children: [
          AnimatedContainer(
            transform: Matrix4.translationValues(xoffset, yoffset, 0)
              ..scale(isDrawerOpen ? 0.85 : 1.00)
              ..rotateZ(isDrawerOpen ? -0.05 : 0),
            duration: const Duration(milliseconds: 200),
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: isDrawerOpen
                ? GestureDetector(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: _toggleDrawer, // Close drawer
                  )
                : GestureDetector(
                    onTap: _toggleDrawer,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/image/four-circle2 (2).png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ), // Open drawer
                  ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Store Location',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16,
                    ),
                    Text(
                      // _currentAddress
                      "Ismailia,Egypt",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        // controller: ,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Looking for shoes',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.green))),
      ),
    );
  }

  Widget _slct() {
    final List<Map<String, String>> items = [
      {"image": "assets/image/Nike-Logo.png", "label": "Nike"},
      {"image": "assets/image/Puma-Logo.png", "label": "Puma"},
      {"image": "assets/image/Under-Armour-logo.png", "label": "Under \nArmour"},
      {"image": "assets/image/adidas_PNG8.png", "label": "Adidas"},
      {"image": "assets/image/Converse-Logo-2007.png", "label": "Converse"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(items.length, (index) {
        bool isSelected = isPressed[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isPressed = List.generate(items.length, (i) => i == index);
              });
            },
            child: Row(
              children: [
                // Combined container for logo and text
                Container(
                  width: isSelected ? 100 : 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.white,
                    borderRadius: isSelected ? BorderRadius.circular(25) : BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Circular border around logo when selected
                        Container(
                          padding: EdgeInsets.all(3), // Padding to create space for the border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? Colors.white : Colors.transparent, // White color for the circular border
                          ),
                          child: Image.asset(
                            items[index]['image']!,
                            width: isSelected ? 30 : 40,
                            height: isSelected ? 30 : 40,
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 5), // Add space between logo and text
                          Text(
                            items[index]['label']!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }



  // "assets/image/Nike-Logo.png"

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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemCount: ShoesDataModelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 70) / 2,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => _navigateToMenShoes(ShoesDataModelList[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  ShoesDataModelList[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const   Text("Best Seller" , style:  TextStyle(
                                  fontSize: 14,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "AIRBNB"),
                                ),
                                  const SizedBox(height: 5,),

                                  Text(
                                    ShoesDataModelList[index].title,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "AIRBNB"),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${ShoesDataModelList[index].price}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "AIRBNB"),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 8,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle, // You can customize the shape here
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,// Replace with desired icon
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
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
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                          color: Colors.cyan,
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
            color: Colors.white,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                const Positioned(
                    left: 20,
                    top: 20,
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                    )),
                Positioned(
                    left: 90,
                    top: 9,
                    child: IconButton(
                      onPressed:_navigateToFavoritePage ,
                      icon:  Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.grey,
                      ),
                    )),
                const Positioned(
                    right: 20,
                    top: 20,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                 Positioned(
                    right: 90,
                    top: 9,
                    child: IconButton(
                      onPressed:_navigateToNotifaication ,
                      icon:  Icon(
                        Icons.notifications_none,
                        color: Colors.grey,
                      ),
                    )),
                Positioned(
                    top: -20,
                    right: 10,
                    left: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            )),
      ],
    );
  }
}
