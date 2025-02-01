import 'package:dio/dio.dart';
import 'package:training_app/features/restaurant_info_home/model/category_result.dart';
import 'package:training_app/networks/endpoints.dart';

import '../../../../../networks/exception_handler/data_source.dart';
import '../../../../networks/dio/dio.dart';
import '../../model/restaurant_info_model.dart';

final class GetCategoryResultApi {
  static final GetCategoryResultApi _singleton =
      GetCategoryResultApi._internal();
  GetCategoryResultApi._internal();
  static GetCategoryResultApi get instance => _singleton;

  Future<CategoryResultResponseModel> getCategoryResultApi({required int id}) async {
    try {
      Response response = await getHttp(Endpoints.categoryResultEndpoint(id: id));

      if (response.statusCode == 200) {
        final data = CategoryResultResponseModel.fromJson(response.data);
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
