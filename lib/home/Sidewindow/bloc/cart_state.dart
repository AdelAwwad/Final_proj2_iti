// cart_state.dart

import 'package:equatable/equatable.dart';
import 'package:adel2/home/repository/Repository.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}
class CartLoading extends CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<ShoesData> cartItems;

  const CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}
