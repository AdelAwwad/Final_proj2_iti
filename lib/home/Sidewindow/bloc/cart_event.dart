// cart_event.dart

import 'package:equatable/equatable.dart';
import 'package:adel2/home/repository/Repository.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final ShoesData product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final ShoesData product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];
}

class LoadCart extends CartEvent {}
class IncreaseQuantity extends CartEvent {
  final ShoesData item;

  IncreaseQuantity(this.item);
}

class DecreaseQuantity extends CartEvent {
  final ShoesData item;

  DecreaseQuantity(this.item);
}

