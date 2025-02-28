import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  bestSeller() {
    emit(BestSellerLoadingState());
    HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState(error: 'Something went wrong'));
      }
    });
  }
}