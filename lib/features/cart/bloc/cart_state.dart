part of 'cart_bloc.dart';

abstract class CartState {}

class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartList;
  CartSuccessState({required this.cartList});
}

class CartRemoveItemFromCartActionState extends CartActionState {}
