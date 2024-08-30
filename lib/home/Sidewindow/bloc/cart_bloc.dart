import 'package:adel2/home/Sidewindow/bloc/cart_event.dart';
import 'package:adel2/home/repository/Repository.dart';
import 'package:adel2/home/repository/cart_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  late CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);

  }
  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepository.fetchCartItems(); // Fetch from repository
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(CartError('Failed to load cart items'));
    }
  }
  void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    try {
      cartRepository.addProduct(event.product);
      emit(CartLoaded(cartRepository.getCartItems()));
    } catch (e) {
      emit(CartError('Failed to add product'));
    }
  }


  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) {
    try {
      cartRepository.removeProduct(event.product);
      emit(CartLoaded(cartRepository.getCartItems()));
    } catch (e) {
      emit(CartError('Failed to remove product'));
    }
  }
}