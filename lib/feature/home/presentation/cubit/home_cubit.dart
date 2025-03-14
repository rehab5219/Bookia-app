import 'package:bookia/feature/home/data/models/best_sellers_response/best_sellers_response.dart';
import 'package:bookia/feature/home/data/models/get_slider_response/get_slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  BestSellersResponse? bestSellersResponse;
  GetSliderResponse? getSliderResponse;

  getbestSeller() {
    emit(BestSellerLoadingState());
    HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        bestSellersResponse = value;
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState(error: 'Something went wrong'));
      }
    });
  }

  getSlider() {
    emit(SliderLoadingState());
    HomeRepo.getSlider().then((value) {
      if (value != null) {
        getSliderResponse = value;
        emit(SliderSuccessState());
      } else {
        emit(SliderErrorState(error: 'Something went wrong'));
      }
    });
  }
   addToWishlist(int id) {
    emit(AddToWishlistLoadingState());
    WishlistRepo.addToWishlist(id).then((value) {
      if (value) {
        emit(AddToWishlistSuccessState());
      } else {
        emit(AddToWishlistErrorState(error: 'Something went wrong'));
      }
    });
  }
}
