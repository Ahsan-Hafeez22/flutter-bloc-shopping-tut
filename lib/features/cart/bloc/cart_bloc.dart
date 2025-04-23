import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/data/cart_item.dart';
import 'package:bloc_tut/features/home/model/home_product_data_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemFromCartEvent>(cartRemoveItemFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList: cartItems));
  }

  FutureOr<void> cartRemoveItemFromCartEvent(
      CartRemoveItemFromCartEvent event, Emitter<CartState> emit) {
    log('Cart Product Remove Clicked');
    cartItems.remove(event.clickedProduct);
    emit(CartRemoveItemFromCartActionState());
    emit(CartSuccessState(cartList: cartItems));
  }
}
