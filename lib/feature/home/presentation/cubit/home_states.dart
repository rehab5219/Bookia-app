sealed class HomeState {}

class HomeInitialState extends HomeState {}

class BestSellerLoadingState extends HomeState {}

class BestSellerSuccessState extends HomeState {}

class BestSellerErrorState extends HomeState {
  final String error;

 BestSellerErrorState({required this.error});
}