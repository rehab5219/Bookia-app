import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/constants/endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/feature/wishlist/data/models/get_whishlist_response/get_whishlist_response.dart';

class WishlistRepo {
  static Future<GetWhishlistResponse?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: AppEndpoints.wishlist,
        headers: {
          'Authorization':
              'Bearer${AppLocalStorage.getData(AppConstants.kToken)}',
        },
      );
      if (response.statusCode == 200) {
        return GetWhishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }
  static Future<bool> addToWishlist(int id) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppEndpoints.addToWishlist,
        params: {
          'product_id' : id
        },
        headers: {
          'Authorization':
              'Bearer${AppLocalStorage.getData(AppConstants.kToken)}',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }
  static Future<GetWhishlistResponse?> deleteFromWishlist(int id) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppEndpoints.removeFromWishlist,
        params: {
          'product_id' : id
        },
        headers: {
          'Authorization':
              'Bearer${AppLocalStorage.getData(AppConstants.kToken)}',
        },
      );
      if (response.statusCode == 200) {
        return GetWhishlistResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }
}
