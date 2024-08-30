import 'package:flutter/material.dart';
import 'package:adel2/home/repository/Repository.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<ShoesData> ShoesDataModelList = [];


  @override
  void initState() {
    super.initState();
    repodata();
  }
  void repodata() {
    ShoesDataModelList = [
      ShoesData("assets/image/Nike4.png", "Nike Jordan", 493.00),
      ShoesData("assets/image/Nike5+.png", "Nike Air Max", 897.99),
      ShoesData('assets/image/Nike6.png', "Nike Air Jordan", 849.69),
      ShoesData("assets/image/Nike7+.png", "Nike Air Max", 576.65),
      ShoesData("assets/image/Nike8.png", "Nike Air Jordan", 364.95)

    ];
    // Call setState to trigger a rebuild with the updated data
  }

  void _navigateToPrev() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: _page5()),
      ),
    );
  }

  Widget _page5() {
    return Column(children: [
      _header(),
      const SizedBox(height: 30),

      const SizedBox(height: 10),
      _ShoeNoti(),
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
            "Notifications",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB"),
          ),
          const Text(
            "Clear All",
            style: TextStyle(
              fontSize: 15,
              color: Colors.cyan,
              fontWeight: FontWeight.w500,
              fontFamily: "AIRBNB",
            ),
          ),
        ],
      ),
    );
  }

  Widget  _ShoeNoti(){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(

        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Today', style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB"),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white
                  ),

                  child: Image.asset(ShoesDataModelList[1].image,width: 120,height: 120,)),
              SizedBox(width: 10,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('We have New \nProducts With Offers',
                    textAlign: TextAlign.justify
                    ,style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontFamily: "AIRBNB"),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20,top: 5),
                    child: Text("\$${ShoesDataModelList[1].price.toStringAsFixed(2)} "+" \$260.00",
                        textAlign: TextAlign.start
                      ,style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600 ,
                          fontFamily: "AIRBNB"
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(width: 60,),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: const Text(
                    "6 min ago",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontFamily: "AIRBNB",
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 50,bottom: 20),
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            )
            ],
          ),
            SizedBox(height: 30,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white
                  ),
                  child: Image.asset(ShoesDataModelList[3].image,)),
              SizedBox(width: 10,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('We have New \nProducts With Offers',
                    textAlign: TextAlign.justify
                    ,style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "AIRBNB"),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20,top: 5),
                    child: Text("\$${ShoesDataModelList[3].price.toStringAsFixed(2)} "+" \$260.00",
                        textAlign: TextAlign.start
                        ,style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600 ,
                            fontFamily: "AIRBNB"
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(width: 60,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: const Text(
                      "6 min ago",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "AIRBNB",
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 50,bottom: 20),
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Yesterday', style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "AIRBNB"),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white
                  ),


                  child: Image.asset(ShoesDataModelList[4].image,width: 120,height: 120,)),
              SizedBox(width: 10,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('We have New \nProducts With Offers',
                    textAlign: TextAlign.justify
                    ,style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "AIRBNB"),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20,top: 5),
                    child: Text("\$${ShoesDataModelList[4].price.toStringAsFixed(2)} "+" \$260.00",
                        textAlign: TextAlign.start
                        ,style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600 ,
                            fontFamily: "AIRBNB"
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(width: 53,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: const Text(
                      "4 days ago",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "AIRBNB",
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white
                  ),

                  child: Image.asset(ShoesDataModelList[2].image,width: 120,height: 120,)),
              SizedBox(width: 10,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('We have New \nProducts With Offers',
                    textAlign: TextAlign.justify
                    ,style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "AIRBNB"),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 20,top: 5),
                    child: Text("\$${ShoesDataModelList[2].price.toStringAsFixed(2)} "+" \$260.00",
                        textAlign: TextAlign.start
                        ,style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600 ,
                            fontFamily: "AIRBNB"
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(width: 53,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: const Text(
                      "4 days ago",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "AIRBNB",
                      ),
                    ),
                  ),



                ],
              )
            ],
          )







        ],


      ),
    );
  }



}
