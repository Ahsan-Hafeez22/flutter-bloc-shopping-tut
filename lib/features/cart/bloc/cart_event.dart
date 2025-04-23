part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemFromCartEvent extends CartEvent {
  final ProductDataModel clickedProduct;
  CartRemoveItemFromCartEvent({required this.clickedProduct});
}
