import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_tut/data/wishlist_items.dart';
import 'package:bloc_tut/features/home/model/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveItemFromWishListEvent>(
        wishListRemoveItemFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(wishList: wishListItem));
  }

  FutureOr<void> wishListRemoveItemFromWishListEvent(
      WishListRemoveItemFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItem.remove(event.clickedProduct);
    emit(WishListRemoveItemFromWishListActionState());
    emit(WishListSuccessState(wishList: wishListItem));
  }
}
