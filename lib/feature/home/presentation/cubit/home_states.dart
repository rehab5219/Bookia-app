sealed class HomeState {}

class HomeInitialState extends HomeState {}

class BestSellerLoadingState extends HomeState {}

class BestSellerSuccessState extends HomeState {}

class SliderLoadingState extends HomeState {}

class SliderSuccessState extends HomeState {}

class AddToWishlistLoadingState extends HomeState {}

class AddToWishlistSuccessState extends HomeState {}

class AddToWishlistErrorState extends HomeState {
  final String error;

  AddToWishlistErrorState({required this.error});
}

class BestSellerErrorState extends HomeState {
  final String error;

  BestSellerErrorState({required this.error});
}

class SliderErrorState extends HomeState {
  final String error;

  SliderErrorState({required this.error});
}
