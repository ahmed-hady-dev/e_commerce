import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/model/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());
  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishListProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishListProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishListToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishListProductToState(AddWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishListProductToState(RemoveWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
