import 'package:tofan/app/archive/data/models/archive_response.dart';
import 'package:tofan/core/networks/api_error_handler.dart';
import 'package:tofan/core/networks/api_result.dart';
import 'package:dio/dio.dart';

class ArchiveRepo {
  Future<ApiResult<List<ArchiveResponse>>> getNakba() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
          "https://www.pal48.ps/api/nakba?api_password=eth_pal48ps&lang=ar");
      print(response.data);
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
  Future<ApiResult<List<ArchiveResponse>>> getMassacre() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
          "https://www.pal48.ps/api/massacre?api_password=eth_pal48ps&lang=ar&page=1");
      print(response.data);
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
  Future<ApiResult<List<ArchiveResponse>>> getAqsa() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
          "https://www.pal48.ps/api/aqsa?api_password=eth_pal48ps&lang=ar");
      print(response.data);
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
  Future<ApiResult<List<ArchiveResponse>>> getPlace() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
          "https://www.pal48.ps/api/place?api_password=eth_pal48ps&lang=ar&page=1");
      print(response.data);
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
  Future<ApiResult<List<ArchiveResponse>>> getArticles() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
          "https://www.pal48.ps/api/articles?api_password=eth_pal48ps&lang=ar");
      print(response.data);
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
}
