import 'package:bloc_tut/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_tut/features/wishlist/ui/product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Wish List Items',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: BlocConsumer(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        listener: (context, state) {
          if (state is WishListRemoveItemFromWishListActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Product Removed from Wish List'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        builder: (context, state) {
          if (state is WishListSuccessState) {
            final successState = state;
            return ListView.builder(
              itemCount: successState.wishList.length,
              itemBuilder: (context, index) {
                return ProductWishlistListTile(
                    productDataModel: successState.wishList[index],
                    wishlistBloc: wishlistBloc);
              },
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
