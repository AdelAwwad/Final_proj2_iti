import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adel2/home/Sidewindow/bloc/cart_bloc.dart';
import 'package:adel2/home/Sidewindow/bloc/cart_event.dart';
import 'package:adel2/home/Sidewindow/bloc/cart_state.dart';
import 'package:adel2/home/repository/Repository.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the screen is initialized
    BlocProvider.of<CartBloc>(context).add(LoadCart());
  }

  void _navigateToPrev() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: "AIRBNB",
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: _navigateToPrev,
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartItems = state.cartItems;

            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _cartItemWidget(item);
              },
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _cartItemWidget(ShoesData item) {
    int quantity = 1; // This should be managed within your cart logic

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(

        children: [
          SizedBox(
            width: 100,
            height: 70,
            child: Image.asset(item.image, fit: BoxFit.fill),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "AIRBNB",
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "\$${item.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "AIRBNB",
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      minimumSize: const Size(20, 20),
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Text("$quantity"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      minimumSize: const Size(20, 20),
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 90),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("L",style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "AIRBNB",),),
              SizedBox(height: 10,),
              Icon(Icons.delete_outline_outlined,color: Colors.grey,)
            ],
          ),


        ],
      ),
    );
  }
}
