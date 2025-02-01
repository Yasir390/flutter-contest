import 'package:dio/dio.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';
import '../../../../networks/dio/dio.dart';
import '../../model/restaurant_info_model.dart';

final class GetRestaurantInfoApi {
  static final GetRestaurantInfoApi _singleton =
      GetRestaurantInfoApi._internal();
  GetRestaurantInfoApi._internal();
  static GetRestaurantInfoApi get instance => _singleton;
  // String restaurantInfoEndpoint =
  //     " https://demo-api.devdata.top/api/RestaurantInfo/GetRestaurantInfo";
  Future<RestaurantInfoResponseModel> getRestaurantInfoApi() async {
    try {
      Response response = await getHttp(Endpoints.restaurantInfoEndpoint());

      if (response.statusCode == 200) {
        final data = RestaurantInfoResponseModel.fromJson(response.data);
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
