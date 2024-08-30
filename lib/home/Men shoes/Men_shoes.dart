import 'package:adel2/home/Best%20seller/BestSeller.dart';
import 'package:flutter/material.dart';
import 'package:adel2/home/repository/Repository.dart';

class MenShoes extends StatefulWidget {
  final ShoesData selectedShoe;

  const MenShoes({super.key, required this.selectedShoe});

  @override
  State<MenShoes> createState() => _MenShoesState();
}

class _MenShoesState extends State<MenShoes> {
  final ScrollController _scrollController = ScrollController();
  List<ShoesData> ShoesDataModelList = []; // Initialize with an empty list


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
    setState(() {}); // Call setState to trigger a rebuild with the updated data
  }

  void _navigateToPrev() {
    Navigator.pop(context);
  }
  void _navigateToBstslrPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Bestseller()));
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
              )),
          const Text(
            "Men's Shoes",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB"),
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
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  widget.selectedShoe.image,
                  fit: BoxFit.cover,
                )),
          ],
        )
      ],
    );
  }

  Widget _ShoeInfo() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration:  BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(18) ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed:_navigateToBstslrPage ,
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
                        width: (MediaQuery.of(context).size.width - 200) / 3,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Set the grey background color here
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
            const Row(


            )

          ],
        ),
      ),
    );
  }

}
