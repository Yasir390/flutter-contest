import 'package:dio/dio.dart';
import 'package:training_app/features/restaurant_info_home/model/category_tab_response_model.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';
import '../../../../networks/dio/dio.dart';
import '../../model/restaurant_info_model.dart';

final class GetCategoryTabApi {
  static final GetCategoryTabApi _singleton = GetCategoryTabApi._internal();
  GetCategoryTabApi._internal();
  static GetCategoryTabApi get instance => _singleton;

  Future<CategoryTabResponseModel> getCategoryTabApi() async {
    try {
      Response response = await getHttp(Endpoints.categoryTabEndpoint());

      if (response.statusCode == 200) {
        final data = CategoryTabResponseModel.fromJson(response.data);
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
