import 'package:bookia/feature/wishlist/data/models/get_whishlist_response/get_whishlist_response.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());

  GetWhishlistResponse? wishlistResponse;

  getWishlist() {
    emit(GetWishlistLoadingState());
    WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        wishlistResponse = value;
        emit(GetWishlistSuccessState());
      } else {
        emit(WishlistErrorState(error: 'Something went wrong'));
      }
    });
  }

  deleteFromWishlist(int id) {
    emit(DeleteFromWishlistLoadingState());
    WishlistRepo.deleteFromWishlist(id).then((value) {
     if (value != null) {
        wishlistResponse = value;
        emit(DeleteFromWishlistSuccessState());
      } else {
        emit(WishlistErrorState(error: 'Something went wrong'));
      }
    });
  }
}
