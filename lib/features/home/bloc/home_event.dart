part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProductDataModel;
  HomeProductCartButtonClickedEvent({required this.clickedProductDataModel});
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProductDataModel;
  HomeProductWishlistButtonClickedEvent(
      {required this.clickedProductDataModel});
}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent {}
