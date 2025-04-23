part of 'wishlist_bloc.dart';

abstract class WishlistState {}

abstract class WishListActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> wishList;

  WishListSuccessState({required this.wishList});
}

class WishListRemoveItemFromWishListActionState extends WishListActionState {}
