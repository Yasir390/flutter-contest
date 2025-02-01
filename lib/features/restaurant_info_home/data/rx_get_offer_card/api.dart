import 'package:dio/dio.dart';
import 'package:training_app/features/restaurant_info_home/model/offer_card_model.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';
import '../../../../networks/dio/dio.dart';
import '../../model/restaurant_info_model.dart';

final class GetOfferCardApi {
  static final GetOfferCardApi _singleton = GetOfferCardApi._internal();
  GetOfferCardApi._internal();
  static GetOfferCardApi get instance => _singleton;
  // String restaurantInfoEndpoint =
  //     " https://demo-api.devdata.top/api/RestaurantInfo/GetRestaurantInfo";
  Future<OfferCardModel> getOfferCardApi() async {
    try {
      Response response = await getHttp(Endpoints.offerCardEndpoint());

      if (response.statusCode == 200) {
        final data = OfferCardModel.fromJson(response.data);
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
