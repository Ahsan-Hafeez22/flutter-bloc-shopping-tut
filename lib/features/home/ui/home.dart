import 'dart:developer';

import 'package:bloc_tut/features/cart/ui/cart.dart';
import 'package:bloc_tut/features/home/bloc/home_bloc.dart';
import 'package:bloc_tut/features/home/ui/product_list_widget.dart';
import 'package:bloc_tut/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wishlist(),
              ));
        } else if (state is HomeProductAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Product Added to Cart'),
            duration: Duration(seconds: 1),
          ));
        } else if (state is HomeProductAddedToWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Product Added to WishList'),
            duration: Duration(seconds: 1),
          ));
        }
      },
      builder: (context, state) {
        log(state.runtimeType.toString());
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeSuccessState) {
          final successState = state;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                'Grocery Store',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonNavigateEvent());
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: successState.productList.length,
              itemBuilder: (context, index) {
                return ProductListContainer(
                    homeBloc: homeBloc,
                    productDataModel: successState.productList[index]);
              },
            ),
          );
        } else if (state is HomeErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error Occurred'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }
      },
    );
  }
}
