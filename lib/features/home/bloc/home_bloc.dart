import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/data/cart_item.dart';
import 'package:bloc_tut/data/grocery_data.dart';
import 'package:bloc_tut/data/wishlist_items.dart';
import 'package:bloc_tut/features/home/model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeInitialEvent>(homeInitialEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeSuccessState(
        productList: Grocerydata.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                imageUrl: e['imageUrl'],
                price: e['price'],
                description: e['description']))
            .toList()));
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    log('Cart Icon Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    log('Wishlist Icon Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Cart Product List Clicked');
    cartItems.add(event.clickedProductDataModel);
    emit(HomeProductAddedToCartActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Wishlist Product List Clicked');
    wishListItem.add(event.clickedProductDataModel);
    emit(HomeProductAddedToWishListActionState());
  }
}
