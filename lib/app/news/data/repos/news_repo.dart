import 'package:tofan/app/news/data/models/news_response.dart';
import 'package:tofan/core/networks/api_error_handler.dart';
import 'package:tofan/core/networks/api_result.dart';
import 'package:dio/dio.dart';

class NewsRepo {
  Future<ApiResult<List<NewsResponse>>> getNews() async {
    try {
      final Dio dio = Dio();
      final response =
          await dio.get("https://arabicbee.com/tofan/api/news.php");
      return ApiResult.success(data: response.data);
    } catch (error) {
      print(ApiErrorHandler.handleError(error));
      // logger.d("Logger is working!");
      //  ApiError apiError = ApiErrorHandler.handleError(error);
      return const ApiResult.failure(error: "jh");
    }
  }
}
