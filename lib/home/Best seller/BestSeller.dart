import 'package:flutter/material.dart';
import 'package:adel2/home/repository/Repository.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {
  List<ShoesData> ShoesDataModelList = [];


  @override
  void initState() {
    super.initState();
    repodata();
  }

  void _navigateToPrev() {
    Navigator.pop(context);
  }

  void repodata() {
    ShoesDataModelList = [
      ShoesData("assets/image/sketch3.png", "Nike Air Force", 367.76),
      ShoesData("assets/image/Nike9.png", "Nike Air Max", 254.89),
      ShoesData('assets/image/Nike5.jpg', "Nike  Jordan", 367.76),
      ShoesData("assets/image/Nike10.png", "Nike Air Max",  254.89),
      ShoesData("assets/image/Nike11.png", "Nike Air Force", 367.76),
      ShoesData("assets/image/Nike12.png", "Nike Air Max",  254.89),


    ];
    // Call setState to trigger a rebuild with the updated data
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: _page4()),
      ),
    );
  }


  Widget _page4() {
    return Column(children: [
      _header(),
      const SizedBox(height: 30),
      _Shoedata(),
      // const SizedBox(height: 20),
      // _ShoeInfo(),
    ]);
  }


  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  onPressed: _navigateToPrev,
                  elevation: 0.5,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              )),
          const Text(
            "BEST SELLER",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB"),
          ),
          Row(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(1.5708), // 90 degrees in radians
                child: Icon(Icons.tune),
              ),
              SizedBox(width: 10,),
              Icon(
                Icons.search_rounded,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _Shoedata() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[0].image,fit: BoxFit.fill,width: 150,height: 100,))

                        ),

                      ],
                    ),
                    SizedBox(height: 13,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[0].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[0].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyanAccent,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyan,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[1].image,fit: BoxFit.fill,))

                        ),

                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[1].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[1].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ],

          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[2].image,fit: BoxFit.fill,height: 103,width: 140,))

                        ),

                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[2].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[2].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[3].image,fit: BoxFit.fill,height: 105,width: 150,))

                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[3].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[3].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[4].image,fit: BoxFit.fill,height: 103,width: 140,))

                        ),

                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[2].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[2].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 170,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 10),

                                child: Image.asset(ShoesDataModelList[5].image,fit: BoxFit.fill,height: 100,width: 120,))

                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "BEST SELLER",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child:  Text(
                          ShoesDataModelList[3].title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Men's Shoes",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "AIRBNB",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(

                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child:  Text(
                              "\$${ShoesDataModelList[3].price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "AIRBNB",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyan,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ],
          )
        ],


      ),
    );
  }

}
