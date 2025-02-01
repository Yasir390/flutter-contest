import 'package:dio/dio.dart';
import 'package:training_app/features/restaurant_info_home/model/category_result.dart';
import 'package:training_app/features/restaurant_info_home/model/food_details_model.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';
import '../../../../networks/dio/dio.dart';
import '../../model/restaurant_info_model.dart';

final class GetFoodDetailsApi {
  static final GetFoodDetailsApi _singleton = GetFoodDetailsApi._internal();
  GetFoodDetailsApi._internal();
  static GetFoodDetailsApi get instance => _singleton;

  Future<FoodDetailsResponseModel> getFoodDetailsApi(
      {required int foodId}) async {
    try {
      Response response =
          await getHttp(Endpoints.foodDetailsEndpoint( foodId: foodId));

      if (response.statusCode == 200) {
        final data = FoodDetailsResponseModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
// Handle generic errors
// throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
