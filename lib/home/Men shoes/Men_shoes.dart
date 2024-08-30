import 'package:adel2/home/Best%20seller/BestSeller.dart';
import 'package:adel2/home/Sidewindow/bloc/cart_bloc.dart';
import 'package:adel2/home/Sidewindow/bloc/cart_event.dart';
import 'package:adel2/home/Sidewindow/mycart.dart';
import 'package:adel2/home/repository/Repository.dart';
import 'package:adel2/home/repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Replace with your Product model

class MenShoes extends StatefulWidget {
  final ShoesData selectedShoe;

  const MenShoes({super.key, required this.selectedShoe});

  @override
  State<MenShoes> createState() => _MenShoesState();
}

class _MenShoesState extends State<MenShoes> {
  final ScrollController _scrollController = ScrollController();
  List<ShoesData> ShoesDataModelList = [];
  final List<int> sizes = [38, 39, 40, 41, 42, 43];
  int? selectedSize;

  late final CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    repodata();

    _scrollController.addListener(() {
      print('Scroll position: ${_scrollController.position.pixels}');
    });

    _cartBloc = CartBloc(CartRepository());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cartBloc.close();
    super.dispose();
  }

  void repodata() {
    ShoesDataModelList = [
      ShoesData("assets/image/Nike4.png", "Nike Jordan", 493.00),
      ShoesData("assets/image/Nike5+.png", "Nike Air Max", 897.99),
      ShoesData('assets/image/Nike6.png', "Nike Air Jordan", 849.69),
    ];
    setState(() {});
  }

  void _navigateToPrev() {
    Navigator.pop(context);
  }

  void _navigateToBstslrPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Bestseller()));
  }



  void _addToCart() {
    final product = ShoesData(
        widget.selectedShoe.image, widget.selectedShoe.title,widget.selectedShoe.price);
    _cartBloc.add(AddProduct(product));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: _page3()),
      ),
    );
  }

  Widget _page3() {
    return Column(children: [
      _header(),
      const SizedBox(height: 30),
      _Shoedata(),
      const SizedBox(height: 20),
      _ShoeInfo(),
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
            ),
          ),
          const Text(
            "Men's Shoes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: "AIRBNB",
            ),
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              onPressed: () {},
              elevation: 0.5,
              child: const Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Shoedata() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.asset(
                widget.selectedShoe.image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _ShoeInfo() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: _navigateToBstslrPage,
              child: const Text(
                "BEST SELLER",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.cyan,
                  fontWeight: FontWeight.w500,
                  fontFamily: "AIRBNB",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.selectedShoe.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "\$${widget.selectedShoe.price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Air Jordan is an American brand of basketball Shoes, athletic, casual, and style clothing produced by Nike....",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: "AIRBNB",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Gallery",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB",
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: ShoesDataModelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width - 200) / 3,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            ShoesDataModelList[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: "AIRBNB",
                  ),
                ),
                Text(
                  "EU  US  UK",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontFamily: "AIRBNB",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(sizes.length, (index) {
                bool isSelected = selectedSize == sizes[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = sizes[index];
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[100],
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ]
                          : [],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      sizes[index].toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "AIRBNB",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "\$${widget.selectedShoe.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: "AIRBNB",
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: _addToCart,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "AIRBNB",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(170, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
