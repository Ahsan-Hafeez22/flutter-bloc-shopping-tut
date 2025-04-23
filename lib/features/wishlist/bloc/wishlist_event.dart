part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishListRemoveItemFromWishListEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  WishListRemoveItemFromWishListEvent({required this.clickedProduct});
}
