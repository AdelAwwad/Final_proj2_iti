import 'package:adel2/LogIn/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';
class Sidewindow extends StatefulWidget {
  const Sidewindow({super.key});

  @override
  State<Sidewindow> createState() => _SidewindowState();
}

class _SidewindowState extends State<Sidewindow> {
  String? _name;

  @override
  void initState() {
    _loadName();
    super.initState();
  }

  void _navigateToProfilePage() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage()));
  }
  void _navigateTohHomePage(){
    Navigator.pop(context);
  }
  void _navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
  }

  void _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'Guest'; // Default if no name is found
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: SingleChildScrollView(
          child: _Sidepage(),
        ));
  }

  Widget _Sidepage() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/image/myphoto.jpeg",
              width: 70.0, // You can adjust the width and height
              height: 70.0,
              fit: BoxFit
                  .cover, // This will ensure the image covers the circular area
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                'Hey, ',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              // Icon(Icons.ios,color: Colors.yellow,),
              Image(
                  image: AssetImage("assets/image/waving-hand-icon.png"),
                  width: 25,
                  height: 25)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            _name ?? 'Loading ...',
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: _navigateToProfilePage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon: const Icon(Icons.person_outline_rounded ,size: 20,color: Colors.grey),
                  onPressed:_navigateToProfilePage,
                  padding: EdgeInsets.zero,

                ),
                const SizedBox(width: 8),
                const Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight:  FontWeight.w400),
                ),
              ],
            ),
          ),
          const   SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap:_navigateTohHomePage ,
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.home_outlined ,size: 20,color: Colors.grey),
                  onPressed:_navigateTohHomePage,
                  padding: EdgeInsets.zero,

                ),
                const SizedBox(width: 8),
                const Text(
                  'Home Page',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),  const   SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.shopping_bag_outlined ,size: 20,color: Colors.grey),
                onPressed:() {},
                padding: EdgeInsets.zero,

              ),
              const SizedBox(width: 8),
              const Text(
                'My Cart',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight:  FontWeight.w400),
              ),
            ],
          ),  const   SizedBox(
            height: 20,
          ),


          Row(
            children: [
              IconButton(icon: const Icon(Icons.favorite_outline_rounded ,size: 20,color: Colors.grey),
                onPressed:(){},
                padding: EdgeInsets.zero,

              ),
              const SizedBox(width: 8),
              const Text(
                'Favorite',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight:  FontWeight.w400),
              ),
            ],
          ), const   SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.fire_truck_outlined ,size: 20,color: Colors.grey),
                onPressed:(){},
                padding: EdgeInsets.zero,

              ),
              const SizedBox(width: 8),
              const Text(
                'Orders',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight:  FontWeight.w400),
              ),
            ],
          ),  const   SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.notifications_none ,size: 20,color: Colors.grey),
                onPressed:(){},
                padding: EdgeInsets.zero,

              ),
              const SizedBox(width: 8),
              const Text(
                'Notifications',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),

            ],

          ),
          const SizedBox(height: 20,),
          const Divider(
            color: Colors.grey, // Customize the color
            thickness: 2.0, // Customize the thickness
            indent: 15.0, // Customize the indentation from the start
            endIndent: 210.0, // Customize the indentation from the end
          ),
          const   SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: _navigateToSignIn,
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.logout_outlined ,size: 20,color: Colors.grey),
                  onPressed:_navigateToSignIn,
                  padding: EdgeInsets.zero,

                ),
                const SizedBox(width: 8),
                const Text(
                  'Sign Out',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),

              ],

            ),
          ),
        ],

      ),
    );
  }
}
