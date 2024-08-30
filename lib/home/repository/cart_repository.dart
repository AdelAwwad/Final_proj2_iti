

import 'package:adel2/home/repository/Repository.dart';

class CartRepository {
  final List<ShoesData> _cartItems = [];

  // Example method to fetch cart items
  Future<List<ShoesData>> fetchCartItems() async {
    // This is just a placeholder. Replace with your actual data fetching logic.
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network delay
    return [
      ShoesData("assets/image/Nike4.png", "Nike Jordan", 493.00),
      ShoesData("assets/image/Nike5+.png", "Nike Air Max", 897.99),
      ShoesData('assets/image/Nike6.png', "Nike Air Jordan", 849.69),];
  }

  List<ShoesData> getCartItems() {
    return List.unmodifiable(_cartItems); // Return a read-only view
  }

  void addProduct(ShoesData product) {
    _cartItems.add(product);
  }

  void removeProduct(ShoesData product) {
    _cartItems.remove(product);
  }
}