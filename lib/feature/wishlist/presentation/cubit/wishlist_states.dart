sealed class WishlistState {}

class WishlistInitialState extends WishlistState {}

class GetWishlistLoadingState extends WishlistState {}

class GetWishlistSuccessState extends WishlistState {}

class DeleteFromWishlistLoadingState extends WishlistState {}

class DeleteFromWishlistSuccessState extends WishlistState {}

class WishlistErrorState extends WishlistState {
  final String error;

  WishlistErrorState({required this.error});
}
