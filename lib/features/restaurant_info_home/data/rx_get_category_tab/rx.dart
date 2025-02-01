// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:rxdart/rxdart.dart';
import 'package:training_app/features/restaurant_info_home/model/category_tab_response_model.dart';

import '../../../../../helpers/toast.dart';
import '../../../../../networks/rx_base.dart';
import '../../model/restaurant_info_model.dart';
import 'api.dart';

final class GetCategoryTabRx
    extends RxResponseInt<CategoryTabResponseModel> {
  final api = GetCategoryTabApi.instance;

  GetCategoryTabRx({required super.empty, required super.dataFetcher});

  ValueStream get commentSteam => dataFetcher.stream;

  Future<CategoryTabResponseModel?> getCategoryTabRx() async {
    try {
      final CategoryTabResponseModel data = await api.getCategoryTabApi();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
// Handle the error locally and return a fallback response
      if (error is DioException) {
        ToastUtil.showShortToast(
            error.response!.data["message"] ?? "Unknown error");
      }
      log(error.toString());
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
// throw error;
    return false;
  }
}
