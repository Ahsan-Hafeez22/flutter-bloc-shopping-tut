part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductDataModel> productList;
  HomeSuccessState({required this.productList});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductAddedToCartActionState extends HomeActionState {}

class HomeProductAddedToWishListActionState extends HomeActionState {}
